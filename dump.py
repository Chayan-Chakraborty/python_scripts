import mysql.connector
import pandas as pd
from openpyxl import Workbook
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging
from datetime import datetime, timedelta

# Database configurations
db_configs = {
    'dev':{
        'user': 'admin',
        'password': 'fMZewU6YGm7mNJycCm1R',
        'host': 'host.docker.internal',
        'database': 'data_warehouse',
        'port' : 3307
    }
    # Add more databases as needed
}

def get_db_config(name):
    return db_configs.get(name)

def fetch_data_from_db(db_config, query):
    try:
        logging.info(f"Connecting to database: {db_config['database']} at {db_config['host']}:{db_config['port']}")
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor(dictionary=True)
        cursor.execute(query)
        data = cursor.fetchall()
        cursor.close()
        connection.close()
        return data
    except mysql.connector.Error as err:
        logging.error(f"Error: {err}")
        return []
 
def insert_data_into_table(data, table_name, db_config):
    if not data:
        print("No data to insert.")
        return

    # Get column names from keys of the first row
    columns = list(data[0].keys())
    column_names = ', '.join(columns)
    placeholders = ', '.join(['%s'] * len(columns))

    insert_query = f"""
    INSERT INTO {table_name} ({column_names})
    VALUES ({placeholders})
    """

    # Convert dict rows to tuples of values
    values = [tuple(row[col] for col in columns) for row in data]

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.executemany(insert_query, values)
        conn.commit()
        print(f"Inserted {cursor.rowcount} rows into {table_name}.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

def main(environment_name):
    query = f"""WITH
  estimator_ranked AS (
    SELECT
      e.user_id,
      e.id AS quotation_id,
      e.status AS quotation_status,
      e.updated_at AS quotation_updation_date,
      ROW_NUMBER() OVER (
        PARTITION BY
          e.user_id
        ORDER BY
          e.updated_at DESC
      ) AS rn
    FROM
      estimator e
  ),
  daas_ranked AS (
    SELECT
      d.contractor_id_number,
      d.project_id AS daas_project_id,
      d.first_amount_received_date,
      d.last_amount_received_date,
      d.lead_date,
      GREATEST(
        d.lead_date,
        d.first_amount_received_date,
        d.last_amount_received_date
      ) AS max_date,
      ROW_NUMBER() OVER (
        PARTITION BY
          d.contractor_id_number
        ORDER BY
          GREATEST(
            d.lead_date,
            d.first_amount_received_date,
            d.last_amount_received_date
          ) DESC
      ) AS rn
    FROM
      daas d
    WHERE
      payment_enquiry_status IN ('Completed', 'Descoped', 'Installment Done')
  ),
  user_cohort_data AS (
    SELECT
      CASE
      -- Top Funnel
        WHEN user_registered = 'No'
        AND part_a = 'Never Used'
        AND part_b_procurement = 'Never Used' THEN 'TFA'
        WHEN user_registered = 'Yes'
        AND part_a = 'Never Used'
        AND part_b_procurement = 'Never Used' THEN 'TFB'
        -- Part A + DAAS MECE
        WHEN user_registered = 'Yes'
        AND part_a = 'Ever Used\nNot used in last 30 days'
        AND part_b_daas = 'Used in last 30 days' THEN 'DA'
        WHEN user_registered = 'Yes'
        AND part_a = 'Ever Used\nNot used in last 30 days'
        AND part_b_daas = 'Never Used' THEN 'DB'
        WHEN user_registered = 'Yes'
        AND part_a = 'Used in last 30 days'
        AND part_b_daas = 'Never Used' THEN 'DC'
        WHEN user_registered = 'Yes'
        AND part_a = 'Used in last 30 days'
        AND part_b_daas = 'Ever Used\nNot used in last 30 days' THEN 'DD'
        WHEN user_registered = 'Yes'
        AND part_a = 'Used in last 30 days'
        AND part_b_daas = 'Used in last 30 days' THEN 'DE'
        WHEN part_a = 'Never Used'
        AND part_b_daas = 'Used in last 30 days' THEN 'DF'
        WHEN part_a = 'Never Used'
        AND part_b_daas = 'Ever Used\nNot used in last 30 days' THEN 'DG'
        WHEN user_registered = 'Yes'
        AND part_a = 'Ever Used\nNot used in last 30 days'
        AND part_b_daas = 'Ever Used\nNot used in last 30 days' THEN 'DH'
        WHEN part_a = 'Never Used'
        AND part_b_daas = 'Never Used' THEN 'DI'
        ELSE 'NA'
      END AS daas_cohort_key,
      CASE
      -- Top Funnel
        WHEN user_registered = 'No'
        AND part_a = 'Never Used'
        AND part_b_procurement = 'Never Used' THEN 'TFA'
        WHEN user_registered = 'Yes'
        AND part_a = 'Never Used'
        AND part_b_procurement = 'Never Used' THEN 'TFB'
        -- Part A + Procurement MECE
        WHEN user_registered = 'Yes'
        AND part_a = 'Ever Used\nNot used in last 30 days'
        AND part_b_procurement = 'Used in last 30 days' THEN 'PA'
        WHEN user_registered = 'Yes'
        AND part_a = 'Ever Used\nNot used in last 30 days'
        AND part_b_procurement = 'Never Used' THEN 'PB'
        WHEN user_registered = 'Yes'
        AND part_a = 'Used in last 30 days'
        AND part_b_procurement = 'Never Used' THEN 'PC'
        WHEN user_registered = 'Yes'
        AND part_a = 'Used in last 30 days'
        AND part_b_procurement = 'Ever Used\nNot used in last 30 days' THEN 'PD'
        WHEN user_registered = 'Yes'
        AND part_a = 'Used in last 30 days'
        AND part_b_procurement = 'Used in last 30 days' THEN 'PE'
        WHEN part_a = 'Never Used'
        AND part_b_procurement = 'Used in last 30 days' THEN 'PF'
        WHEN part_a = 'Never Used'
        AND part_b_procurement = 'Ever Used\nNot used in last 30 days' THEN 'PG'
        WHEN user_registered = 'Yes'
        AND part_a = 'Ever Used\nNot used in last 30 days'
        AND part_b_procurement = 'Ever Used\nNot used in last 30 days' THEN 'PH'
        WHEN part_a = 'Never Used'
        AND part_b_procurement = 'Never Used' THEN 'PI'
        ELSE 'NA'
      END AS procurement_cohort_key,
      curdate() AS job_date,
      res.*
    FROM
      (
        SELECT
          ul.user_id,
          -- Condition D
          CASE
            WHEN au.id IS NOT NULL
            AND ul.user_id IS NOT NULL THEN 'Yes'
            ELSE 'No'
          END AS user_registered,
          -- Condition E
          CASE
            WHEN MAX(
              GREATEST(
                IFNULL(est_max.quotation_updation_date, '1900-01-01'),
                IFNULL(dp.updated_at, '1900-01-01'),
                IFNULL(pmg.published_at, '1900-01-01')
              )
            ) = '1900-01-01' THEN 'Never Used'
            WHEN MAX(
              GREATEST(
                IFNULL(est_max.quotation_updation_date, '1900-01-01'),
                IFNULL(dp.updated_at, '1900-01-01'),
                IFNULL(pmg.published_at, '1900-01-01')
              )
            ) < CURDATE() - INTERVAL 30 DAY THEN 'Ever Used\nNot used in last 30 days'
            ELSE 'Used in last 30 days'
          END AS part_a,
          -- Condition F
          CASE
            WHEN MAX(dr.max_date) IS NULL THEN 'Never Used'
            WHEN MAX(dr.max_date) < CURDATE() - INTERVAL 30 DAY THEN 'Ever Used\nNot used in last 30 days'
            ELSE 'Used in last 30 days'
          END AS part_b_daas,
          -- Condition G
          CASE
            WHEN MAX(p.enquiry_date) IS NULL THEN 'Never Used'
            WHEN MAX(p.enquiry_date) < CURDATE() - INTERVAL 30 DAY THEN 'Ever Used\nNot used in last 30 days'
            ELSE 'Used in last 30 days'
          END AS part_b_procurement,
          est_max.quotation_updation_date AS latest_quotation_updation_date,
          est_max.quotation_id AS latest_updated_quotation_id,
          est_max.quotation_status AS latest_quotation_status,
          MAX(dp.updated_at) AS dp_profile_updation_date,
          MAX(pmg.published_at) AS dp_last_photo_update,
          COUNT(DISTINCT pmg.id) AS dp_photo_count,
          dr.lead_date AS daas_lead_date,
          dr.first_amount_received_date,
          dr.last_amount_received_date,
          dr.daas_project_id,
          MAX(p.enquiry_date) AS proc_enquiry_date,
          p.billing_name_mobile_number,
          p.user_name_mobile_number,
          au.created_at AS app_user_registered_date,
          ul.updated_at AS app_user_last_login_date
        FROM
          app_user_login_v2 ul
          LEFT JOIN app_user_v2 au ON au.id = ul.user_id
          LEFT JOIN estimator_ranked est_max ON est_max.user_id = au.id
          AND est_max.rn = 1
          LEFT JOIN digital_profiles dp ON dp.contractor_uuid = au.id
          LEFT JOIN media_collections_digital_profile_links mcdp ON mcdp.digital_profile_id = dp.id
          LEFT JOIN media_collections_project_media_galleries_links mcpmg ON mcpmg.media_collection_id = mcdp.media_collection_id
          LEFT JOIN project_media_galleries pmg ON pmg.id = mcpmg.project_media_gallery_id
          LEFT JOIN daas_ranked dr ON CONVERT(dr.contractor_id_number USING utf8mb4) COLLATE utf8mb4_unicode_ci = CONVERT(au.username USING utf8mb4) COLLATE utf8mb4_unicode_ci
          AND dr.rn = 1
          LEFT JOIN procurement p ON CONVERT(p.user_name_mobile_number USING utf8mb4) COLLATE utf8mb4_unicode_ci = CONVERT(au.username USING utf8mb4) COLLATE utf8mb4_unicode_ci
          OR CONVERT(p.billing_name_mobile_number USING utf8mb4) COLLATE utf8mb4_unicode_ci = CONVERT(au.username USING utf8mb4) COLLATE utf8mb4_unicode_ci
          LEFT JOIN internal_users iu ON iu.user_id = au.id
        WHERE
          iu.id IS NULL
        GROUP BY
          au.id
        UNION ALL
        SELECT
          NULL AS user_id,
          'No' AS user_registered,
          'Never Used' AS part_a,
          -- Condition F
          CASE
            WHEN MAX(dr.max_date) IS NULL THEN 'Never Used'
            WHEN MAX(dr.max_date) < CURDATE() - INTERVAL 30 DAY THEN 'Ever Used\nNot used in last 30 days'
            ELSE 'Used in last 30 days'
          END AS part_b_daas,
          'Never Used' AS part_b_procurement,
          NULL AS latest_quotation_updation_date,
          NULL AS latest_updated_quotation_id,
          NULL AS latest_quotation_status,
          NULL AS dp_profile_updation_date,
          NULL AS dp_last_photo_update,
          NULL AS dp_photo_count,
          dr.lead_date AS daas_lead_date,
          dr.first_amount_received_date,
          dr.last_amount_received_date,
          dr.daas_project_id,
          NULL AS proc_enquiry_date,
          NULL AS billing_name_mobile_number,
          NULL AS user_name_mobile_number,
          au.created_at AS app_user_registered_date,
          ul.updated_at AS app_user_last_login_date
        FROM
          daas_ranked dr
          LEFT JOIN app_user_v2 au ON CONVERT(dr.contractor_id_number USING utf8mb4) COLLATE utf8mb4_unicode_ci = CONVERT(au.username USING utf8mb4) COLLATE utf8mb4_unicode_ci
          AND dr.rn = 1
          LEFT JOIN app_user_login_v2 ul ON au.id = ul.user_id
        WHERE
          au.id IS NULL
        GROUP BY
          dr.contractor_id_number
        UNION ALL
        SELECT
          NULL AS user_id,
          'No' AS user_registered,
          'Never Used' AS part_a,
          'Never Used' AS part_b_daas,
          -- Condition G
          CASE
            WHEN MAX(p.enquiry_date) IS NULL THEN 'Never Used'
            WHEN MAX(p.enquiry_date) < CURDATE() - INTERVAL 30 DAY THEN 'Ever Used\nNot used in last 30 days'
            ELSE 'Used in last 30 days'
          END AS part_b_procurement,
          NULL AS latest_quotation_updation_date,
          NULL AS latest_updated_quotation_id,
          NULL AS latest_quotation_status,
          NULL AS dp_profile_updation_date,
          NULL AS dp_last_photo_update,
          NULL AS dp_photo_count,
          NULL AS daas_lead_date,
          NULL first_amount_received_date,
          NULL last_amount_received_date,
          NULL daas_project_id,
          MAX(p.enquiry_date) AS proc_enquiry_date,
          p.billing_name_mobile_number,
          p.user_name_mobile_number,
          au.created_at AS app_user_registered_date,
          ul.updated_at AS app_user_last_login_date
        FROM
          procurement p
          LEFT JOIN app_user_v2 au ON CONVERT(p.user_name_mobile_number USING utf8mb4) COLLATE utf8mb4_unicode_ci = CONVERT(au.username USING utf8mb4) COLLATE utf8mb4_unicode_ci
          OR CONVERT(p.billing_name_mobile_number USING utf8mb4) COLLATE utf8mb4_unicode_ci = CONVERT(au.username USING utf8mb4) COLLATE utf8mb4_unicode_ci
          LEFT JOIN app_user_login_v2 ul ON au.id = ul.user_id
        WHERE
          au.id IS NULL
        GROUP BY
          COALESCE(
            p.user_name_mobile_number,
            p.billing_name_mobile_number
          )
      ) as res
  )
SELECT
  *
FROM
  user_cohort_data"""
    all_data = []

    db_config = get_db_config(environment_name)

    # Fetch data from each database
    data = fetch_data_from_db(db_config, query)

    insert_data_into_table(data, "user_cohort" ,db_config)
    all_data.extend(data)


# Main script

if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_name)
main('dev')