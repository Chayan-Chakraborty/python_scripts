import pymysql
import requests
import json
from datetime import datetime
import os
import math
# -----------------------------
# Database Configuration
# -----------------------------
DB_CONFIG = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'shield',
        'port' : 3306
    },
    'prod':{
        'user': 'cron_write_user',
        'password': 'ZNkykJA23xKrHzc',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'shield',
        'port' : 3306,
        'autocommit' : False
    },
    'dev':{
        'user': 'admin',
        'password': 'fMZewU6YGm7mNJycCm1R',
        'host': 'localhost',
        'database': 'shield',
        'port' : 3307,
        'autocommit' : False 
    },
    'uat':{
        'user': 'super_user',
        'password': 'ChaMiATeseSe',
        'host': 'localhost',
        'database': 'shield',
        'port' : 3307,
        'autocommit' : False
    }
}

# -----------------------------
# CleverTap Configuration
# -----------------------------
CLEVERTAP_URL = "https://eu1.api.clevertap.com/1/upload"
HEADERS = {
    'dev':{
        "X-CleverTap-Account-Id": "TEST-758-K78-4W7Z",
        "X-CleverTap-Passcode": "UTE-RMW-ASEL",
        "Content-Type": "application/json"
    },
    'stage':{
        "X-CleverTap-Account-Id": "TEST-46W-WRK-5W7Z",
        "X-CleverTap-Passcode": "AMW-QSB-USEL",
        "Content-Type": "application/json"
    },
    'prod':{
        "X-CleverTap-Account-Id": "658-K78-4W7Z",
        "X-CleverTap-Passcode": "WTE-RMW-ASEL",
        "Content-Type": "application/json"
    }
    # Add more databases as needed
}

# -----------------------------
# Config
# -----------------------------
BATCH_SIZE = 50          # Profiles per CleverTap API call
UPDATE_BATCH_SIZE = 1000 # Profiles per DB update

# -----------------------------
# Helper Functions
# -----------------------------
def get_clevertap_headers(environment_name):
    return HEADERS.get(environment_name)

def get_db_config(environment_name):
    return DB_CONFIG.get(environment_name)

def log_to_file(filename, lines):
    log_dir = "logs"
    os.makedirs(log_dir, exist_ok=True)
    log_file = os.path.join(log_dir, filename)
    with open(log_file, "a") as f:
        for line in lines:
            f.write(line + "\n")
        f.write("-" * 60 + "\n")

# -----------------------------
# SQL Queries
# -----------------------------
GET_PROFILE_IDS_QUERY = "SELECT id FROM cms.digital_profiles ORDER BY id ASC;"

def get_update_query_for_batch(ids):
    """Builds a batch update query with limited set of IDs."""
    id_list = ",".join(str(i) for i in ids)
    return f"""
    UPDATE cms.digital_profiles dp
    LEFT JOIN (
        SELECT 
            dp.id AS digital_profile_id,
            COUNT(pmgpl.project_media_gallery_id) AS photoCount
        FROM cms.digital_profiles dp
        LEFT JOIN cms.projects_digital_profile_links pdpl 
            ON pdpl.digital_profile_id = dp.id
        LEFT JOIN cms.project_media_galleries_project_links pmgpl 
            ON pmgpl.project_id = pdpl.project_id
        WHERE dp.id IN ({id_list})
        GROUP BY dp.id
    ) AS counts
    ON dp.id = counts.digital_profile_id
    SET dp.total_photo_uploaded = IFNULL(counts.photoCount, 0)
    WHERE dp.id IN ({id_list});
    """

FETCH_QUERY = """
SELECT 
    dp.contractor_uuid, 
    dp.profile_name, 
    dp.phone_number, 
    dp.total_photo_uploaded
FROM cms.digital_profiles dp;
"""

# -----------------------------
# Core Operations
# -----------------------------
def update_total_photo_uploaded(connection):
    """Batch-wise update of total_photo_uploaded field."""
    try:
        with connection.cursor() as cursor:
            print("📋 Fetching all profile IDs...")
            cursor.execute(GET_PROFILE_IDS_QUERY)
            ids = [row[0] for row in cursor.fetchall()]
            total_ids = len(ids)
            total_batches = math.ceil(total_ids / UPDATE_BATCH_SIZE)
            print(f"🔄 Total profiles: {total_ids}, Batches: {total_batches}")

            for i in range(0, total_ids, UPDATE_BATCH_SIZE):
                batch_ids = ids[i:i + UPDATE_BATCH_SIZE]
                batch_num = (i // UPDATE_BATCH_SIZE) + 1
                print(f"⚙️  Running update batch {batch_num}/{total_batches} ({len(batch_ids)} IDs)...")

                update_query = get_update_query_for_batch(batch_ids)
                cursor.execute(update_query)
                connection.commit()

                print(f"✅ Batch {batch_num}/{total_batches} complete.")
    except Exception as e:
        print(f"⚠️ Error during batch update: {e}")

def fetch_digital_profiles(connection):
    try:
        with connection.cursor(pymysql.cursors.DictCursor) as cursor:
            print("📦 Fetching updated profile data...")
            cursor.execute(FETCH_QUERY)
            profiles = cursor.fetchall()
            print(f"✅ Fetched {len(profiles)} profiles.")
            return profiles
    except Exception as e:
        print(f"⚠️ Error fetching profiles: {e}")
        return []

def build_payload_batch(profiles):
    data = []
    for p in profiles:
        phone = p["phone_number"] or ""
        if phone and not phone.startswith("+91"):
            phone = f"+91{phone}"
        data.append({
            "identity": p["contractor_uuid"],
            "type": "profile",
            "profileData": {
                "Name": p["profile_name"] or "",
                "Phone": phone,
                "Dp_photo_count": p["total_photo_uploaded"] or 0,
                "Last_Updated": datetime.utcnow().isoformat()
            }
        })
    return {"d": data}

def sync_to_clevertap_in_batches(profiles, environment_name):
    total = len(profiles)
    total_batches = math.ceil(total / BATCH_SIZE)
    print(f"🚀 Starting batch sync to CleverTap ({total} profiles, {total_batches} batches)...")

    success_logs, failure_logs = [], []

    for i in range(0, total, BATCH_SIZE):
        batch = profiles[i:i + BATCH_SIZE]
        payload = build_payload_batch(batch)
        batch_num = (i // BATCH_SIZE) + 1

        try:
            response = requests.post(
                CLEVERTAP_URL,
                headers=get_clevertap_headers(environment_name),
                data=json.dumps(payload),
                timeout=20
            )

            timestamp = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC")

            if response.status_code == 200:
                print(f"✅ Batch {batch_num}/{total_batches} succeeded.")
                for p in batch:
                    success_logs.append(f"[{timestamp}] SUCCESS: {p['contractor_uuid']}")
            else:
                print(f"❌ Batch {batch_num}/{total_batches} failed (Status: {response.status_code})")
                for p in batch:
                    failure_logs.append(
                        f"[{timestamp}] FAILURE: {p['contractor_uuid']} | Status: {response.status_code} | Response: {response.text}"
                    )

        except Exception as e:
            timestamp = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S UTC")
            print(f"⚠️ Exception in batch {batch_num}/{total_batches}: {e}")
            for p in batch:
                failure_logs.append(
                    f"[{timestamp}] EXCEPTION: {p['contractor_uuid']} | Error: {e}"
                )

    if success_logs:
        log_to_file("clevertap_success.log", success_logs)
    if failure_logs:
        log_to_file("clevertap_failures.log", failure_logs)

    print(f"📜 Logs written — Success: {len(success_logs)}, Failures: {len(failure_logs)}")

# -----------------------------
# Main Orchestrator
# -----------------------------
def main(environment_name):
    try:
        connection = pymysql.connect(**get_db_config(environment_name))
        update_total_photo_uploaded(connection)
        profiles = fetch_digital_profiles(connection)
        if environment_name != 'local': 
            if profiles:
                sync_to_clevertap_in_batches(profiles, environment_name)
            else:
                print("⚠️ No profiles found to sync.")

    except Exception as e:
        print(f"❌ Unexpected error: {e}")

    finally:
        if 'connection' in locals() and connection.open:
            connection.close()
            print("🔒 Database connection closed.")


if __name__ == "__main__":
    main('local')