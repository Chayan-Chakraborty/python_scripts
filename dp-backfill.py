import time
import pymysql
import requests
from dataclasses import dataclass

# --------------------
# DTO for query result
# --------------------


@dataclass
class UserDTO:
    user_id: int
    org_id: int
    city: str
    state: str
    name: str
    phone_number: str


# --------------------
# DB Connection Config
# --------------------
db_configs = {
    'local': {
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'shield',
        'port': 3306
    },
    'dev': {
        'user': 'admin',
        'password': 'fMZewU6YGm7mNJycCm1R',
        'host': 'localhost',
        'database': 'shield',
        'port': 3307
    },
    'prod': {
        'user': 'cron_read_user',
        'password': 'J5drbt7yHT8NAj4',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'shield',
        'port': 3306
    }
}


def get_db_config(name):
    return db_configs.get(name)

success_ids = []
error_ids   = []


# --------------------
# API Config
# --------------------
API_URL = {
    'local': "http://localhost:8000/v1/api/cms/digital-profiles",
    'dev': "https://dev.letsmultiply.co/v1/api/cms/digital-profiles",
    'prod': "https://letsmultiply.co/v1/api/cms/digital-profiles"
}


def get_api_url(name):
    return API_URL.get(name)


API_HEADERS = {
    "user-agent": "Dart/3.7 (dart:io)",
    "x-user-role": "ADMIN",
    "accept-encoding": "gzip",
    "x-user-name": "8079871340",
    "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4MDc5ODcxMzQwIiwiY3JlZGVudGlhbHMiOiJNVEk0TWc9PSIsImNoYW5uZWwiOiJBRE1JTl9XRUIiLCJ1c2VyUm9sZSI6IkFETUlOIiwiZXhwIjoxNzY1NDc3ODAwLCJ1c2VySWQiOjEyODcsImFwcFVzZXJMb2dpbklkIjo4ODY5fQ.YQN2TCreXGmLAMKZ5kaCAJ9YLQr934_rAHejtAbF7c0",
    "x-payment-mode": "WEBPAGE",
    "content-type": "application/json",
    "x-service-type": "PROCUREMENT",
    "x-payment-client": "JUSPAY",
    "accept-language": "en",
    "x-channel": "ADMIN_WEB",
    "x-internal-client": "DIGITAL_PROFILE",
    "accept-version": "v1",
}


# --------------------
# Helper: batching
# --------------------
def chunked(iterable, size):
    for i in range(0, len(iterable), size):
        yield iterable[i:i + size]


# --------------------
# Main Function
# --------------------
def main(environment, batch_size=10, delay=5):
    query = """
select distinct au.id as user_id,
           oo.org_id as org_id,
           au.city  as city,
           au.state as state,
           au.name as name,
           au.username as phone_number
    from shield.app_user_v2 au
    left join shield.internal_users iu on au.id = iu.`user_id`
    left join shield.app_user_role_mapping aurm on aurm.`user_id` = au.id
    left join cms.digital_profiles dp on au.id = dp.`contractor_uuid`
    left join zeus.organization_owner oo on oo.`user_role_id` = aurm.id
    where dp.id is null 
      and aurm.role_id = 1 
      and iu.id is null 
      and au.city is not null and au.state is not null
      and oo.org_id is not null;
    """

    connection = pymysql.connect(
        cursorclass=pymysql.cursors.DictCursor,
        **get_db_config(environment)
    )

    try:
        with connection.cursor() as cursor:
            cursor.execute(query)
            rows = cursor.fetchall()

            users = [UserDTO(**row) for row in rows]

            count = 0
            for batch_num, batch in enumerate(chunked(users, batch_size), start=1):
                print(f"Processing batch {batch_num} ({len(batch)} users)...")
                for user in batch:
                    payload = {
                        "data": {
                            "contractor_uuid": str(user.user_id),
                            "organization_uuid": str(user.org_id),
                            "email": None,
                            "phone_number": user.phone_number,
                            "google_location_id": None,
                            "theme": None,
                            "business_developer_uuid": None,
                            "is_direct_client_communication_allowed": None,
                            "status": "active",
                            "services": None,
                            "brands": None,
                            "activity_logs": None,
                            "serviceable_areas": None,
                            "profile_name": user.name or '',
                            "fcc_membership": None,
                            "trial_link_expires_at": None,
                            "intro": None,
                            "verified": True,
                            "rating_and_reviews": None,
                            "typical_job_cost_range": None,
                            "work_location": [{"city": user.city, "state": user.state}],
                            "profile_picture": None,
                            "profession": None,
                        }
                    }

                    headers = API_HEADERS.copy()
                    headers["x-org-id"] = str(user.org_id)
                    headers["x-user-id"] = str(user.user_id)

                    response = requests.post(get_api_url(
                        environment), headers=headers, json=payload)
                    count += 1
                    if response.status_code !=200 :
                        error_ids.append(user.user_id)
                        print(f"   ▶ User {user.user_id} - Org {user.org_id} -> {response.status_code} -> {response.text}")
                        print(f"   ▶ Payload :- {payload}")
                    else:
                        success_ids.append(user.user_id)

                # Respect rate limits between batches
                print(f"✅ Finished batch {batch_num}, sleeping {delay}s...\n")
                time.sleep(delay)

            print(f"🎉 Completed all {count} users in {batch_num} batches.")
            print("Success IDs:", success_ids)
            print("Error IDs:", error_ids)

    finally:
        connection.close()


if __name__ == "__main__":
    # Example: process in batches of 20 with 10s delay between batches
    main('local', batch_size=500, delay=2)
