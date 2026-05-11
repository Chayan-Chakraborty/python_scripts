import logging
import os
import re
import sys

import pymysql
from dotenv import load_dotenv

load_dotenv(override=False)

_log_fmt = logging.Formatter("%(asctime)s [%(levelname)s] %(message)s", datefmt="%Y-%m-%dT%H:%M:%S")
_log_level = os.getenv("LOG_LEVEL", "INFO").upper()
_log_file = os.getenv("LOG_FILE", "logs/dp_status_sync_2.log")

os.makedirs(os.path.dirname(_log_file), exist_ok=True)

_file_handler = logging.FileHandler(_log_file)
_file_handler.setFormatter(_log_fmt)

_stream_handler = logging.StreamHandler(sys.stdout)
_stream_handler.setFormatter(_log_fmt)

logging.basicConfig(level=_log_level, handlers=[_file_handler, _stream_handler])
logger = logging.getLogger(__name__)


def _safe_db_name(name: str) -> str:
    if not re.fullmatch(r"[A-Za-z0-9_]+", name):
        raise ValueError(f"Invalid DB name: {name!r}")
    return name


def get_conn():
    return pymysql.connect(
        host=os.environ["RDS_HOST"],
        port=int(os.getenv("RDS_PORT", "3306")),
        user=os.environ["SHIELD_DB_USER"],
        password=os.getenv("SHIELD_DB_PASSWORD", ""),
        charset="utf8mb4",
        autocommit=False,
    )


def main():
    shield_db = _safe_db_name(os.getenv("SHIELD_DB_NAME", "shield"))
    cms_db = _safe_db_name(os.getenv("CMS_DB_NAME", "cms"))

    logger.info("Connecting to DB host=%s port=%s db=%s", os.environ["RDS_HOST"], os.getenv("RDS_PORT", "3306"), shield_db)
    conn = get_conn()
    logger.info("Connected successfully")
    try:
        with conn.cursor() as cur:
            sql = f"SELECT COUNT(*) FROM {shield_db}.app_user_v2 au LIMIT 5;"
            logger.info("Executing: %s", sql)
            cur.execute(sql)
            row = cur.fetchone()
            logger.info("Result: count=%s", row[0])
        conn.commit()
        logger.info("Done.")
    except Exception:
        conn.rollback()
        logger.exception("Failed")
        sys.exit(1)
    finally:
        conn.close()
        logger.info("Connection closed")


if __name__ == "__main__":
    main()
