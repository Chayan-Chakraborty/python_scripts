import mysql.connector
from mysql.connector import Error
from datetime import datetime
import os

# =========================
# ENVIRONMENT
# =========================
APP_ENV = os.getenv("APP_ENV", "local")

db_configs = {
    'local': {
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'cms',
        'port': 3306
    },
    'prod': {
        'user': 'solstice_admin',
        'password': 'MrVr3pyh9SsQ32usWtBK',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'cms',
        'port': 3306,
        'autocommit': False
    },
    'dev': {
        'user': 'admin',
        'password': 'fMZewU6YGm7mNJycCm1R',
        'host': 'localhost',
        'database': 'cms',
        'port': 3307,
        'autocommit': False
    },
    'uat': {
        'user': 'super_user',
        'password': 'ChaMiATeseSe',
        'host': 'localhost',
        'database': 'cms',
        'port': 3307,
        'autocommit': False
    }
}


def get_db_config(env: str):
    config = db_configs.get(env)
    if not config:
        raise ValueError(f"Invalid environment: {env}")
    return config


# =========================
# LOG SETTINGS
# =========================
LOG_FILE = "deactivated_albums.log"
MAX_LOG_SIZE = 1 * 1024 * 1024


def rotate_log_if_needed():
    if os.path.exists(LOG_FILE) and os.path.getsize(LOG_FILE) >= MAX_LOG_SIZE:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        os.rename(LOG_FILE, f"deactivated_albums_old_{timestamp}.log")


def write_log(album_ids, update_query):

    rotate_log_if_needed()

    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    with open(LOG_FILE, "a") as log_file:

        log_file.write(f"\nlogs for ({now})\n")
        log_file.write("----------------------------\n")
        log_file.write(f"Deactivated album ids: {album_ids}\n")

        log_file.write("\n")
        log_file.write(f'Updation Query : "{update_query}"\n')
        log_file.write("----------------------------\n")


# =========================
# CRON LOGIC
# =========================
def deactivate_old_albums(environment: str):

    connection = None
    cursor = None

    try:

        print(f"Running album cleanup cron in: {environment}")

        connection = mysql.connector.connect(**get_db_config(environment))
        connection.start_transaction()

        cursor = connection.cursor(dictionary=True)

        # Step 1: Fetch albums eligible for deactivation
        select_query = """
        SELECT a.id
        FROM albums a
        WHERE a.is_active = 1
        AND a.last_photo_deleted_at IS NOT NULL
        AND a.last_photo_deleted_at < NOW() - INTERVAL 10 DAY
        AND NOT EXISTS (
            SELECT 1
            FROM albums_project_media_galleries_links ap
            WHERE ap.album_id = a.id
        )
        """

        cursor.execute(select_query)
        rows = cursor.fetchall()

        if not rows:
            print("No albums found for deactivation")
            connection.commit()
            return

        album_ids = [row["id"] for row in rows]

        print(f"Albums to deactivate: {len(album_ids)}")

        ids_string = ",".join(map(str, album_ids))

        update_query = f"""UPDATE albums SET is_active = 0,updated_at = NOW()
        WHERE id IN ({ids_string});""".strip()

        cursor.execute(update_query)

        connection.commit()

        print("Albums successfully marked inactive")

        write_log(album_ids, update_query)

    except Error as db_error:

        print("Database Error:", db_error)

        if connection:
            connection.rollback()

    except Exception as ex:

        print("Unexpected Error:", ex)

        if connection:
            connection.rollback()

    finally:

        if cursor:
            cursor.close()

        if connection:
            connection.close()


# =========================
# ENTRY POINT
# =========================
if __name__ == "__main__":
    deactivate_old_albums("local")
