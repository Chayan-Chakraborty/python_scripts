"""
New Cron Sheet(Product Analytics Dashboard)
Columns : 
'Date', 'Quotations Created', 'Unqiue Users Creating Quotation', 'Quotations Shared', 'Unique Users Sharing Quotation', 'Total Quotations Created', 'Total Quotations Shared', 'Total_Unique_Users_Creating_Quotations', 'Total_Unique_Users_Sharing_Quotations'
"""

from aifc import Error
from datetime import date, datetime, timedelta
import importlib
import sys
import mysql.connector
import pandas as pd
from openpyxl import Workbook
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging


filename = 'Product-Analytics-Dashboard-Data.xlsx'

destination_table = 'quotation_generator_analytics'
# Database configurations
db_configs = {
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

module_env_path = {
    'local' :  '/Users/chayanchakraborty/Documents/python_new_dir/FetchInternalUser.py',
    'prod' :  '/Users/chayanchakraborty/Documents/python_new_dir/FetchInternalUser.py'
}

internal_headers = ['Date', 'Quotations Created', 'Unqiue Users Creating Quotation', 'Quotations Shared', 'Unique Users Sharing Quotation', 'Total Quotations Created', 'Total Quotations Shared', 'Total_Unique_Users_Creating_Quotations', 'Total_Unique_Users_Sharing_Quotations']

email_configs = {
    'local': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'Product-Analytics-Dashboard-Data({(datetime.now() - timedelta(1)).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        #'to_emails': ['chayan.chakraborty@pidilite.vc', 'chinmay.jaripatke@pidilite.vc', 'ahona@pidilite.vc', 'anil@pidilite.vc', 'deepak.agarwal@pidilite.vc', 'varsha.singh@pidilite.vc'], 
        'to_emails': ['chayan.chakraborty@pidilite.vc', 'anil@pidilite.vc'], 
        # List of recipients
        'subject': f'Product-Analytics-Dashboard-Data({(datetime.now() - timedelta(1)).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    }
}

# get email Config based on environment
def get_emial_config(name):
    return email_configs.get(name)

# get dbConfig based on environment
def get_db_config(name):
    return db_configs.get(name)

# Load the module import
def get_internal_users(module_path, filename, environment_name):
    spec = importlib.util.spec_from_file_location(filename, module_path)
    internal_user_script = importlib.util.module_from_spec(spec)
    sys.modules[filename] = internal_user_script
    spec.loader.exec_module(internal_user_script)

    internal_user_script.main(environment_name)
    #print(f"{internal_user_script.main(environment_name)}")
    return internal_user_script.main(environment_name)

# generic method to fetch data as per query
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

# generic method to send email with attachment
def send_email_with_attachment(filename, environment_name):

    email_config = get_emial_config(environment_name)
    logging.info(f"Connecting to database: {email_config['username']} at {email_config['from_email']}:{email_config['to_emails']}")

    msg = MIMEMultipart()
    msg['From'] = email_config['from_email']
    msg['To'] = ', '.join(email_config['to_emails'])
    msg['Subject'] = email_config['subject']
    msg.attach(MIMEText(email_config['body'], 'plain'))

    attachment = open(filename, 'rb')
    part = MIMEBase('application', 'octet-stream')
    part.set_payload(attachment.read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', f'attachment; filename={filename}')
    msg.attach(part)
    attachment.close()

    server = smtplib.SMTP(email_config['smtp_server'], email_config['smtp_port'])
    server.starttls()
    server.login(email_config['username'], email_config['password'])
    text = msg.as_string()
    server.sendmail(email_config['from_email'], email_config['to_emails'], text)
    server.quit()

# generic method to generate excel with dataset
def generate_excel(data, filename):
    df = pd.DataFrame(data)
    df.to_excel(filename, index=False)


def insert_data_into_table(data, table_name, columns, db_config):
    # Connect to the database
    db_config = get_db_config('local')
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    
    # Prepare the column names for the query
    column_names = ', '.join(columns)
    
    # Prepare the placeholders for the query
    placeholders = ', '.join(['%s'] * len(columns))
    
    # Prepare the INSERT query
    insert_query = f"""
    INSERT INTO {table_name} ({column_names})
    VALUES ({placeholders})
    """
    
    try:
        # Execute the query with the provided data
        cursor.execute(insert_query, data)
        conn.commit()
        #print(f"Inserted {cursor.rowcount} rows into {table_name}.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

def backfill_data(start , end, db_config, destination_table, columns, environment_name):
    res_date = start
    while res_date <= end:
        insert_data_into_table(fetch_excel_data(db_config, res_date, start , environment_name), destination_table, columns, db_config)
        res_date += timedelta(days=1)
    
def fetch_excel_data(db_config , curr_date, start_date, environment_name):
    module_path = module_env_path[environment_name]
    filename = "FetchInternalUser"
    internal_users = get_internal_users(module_path, filename, environment_name)

    if curr_date is None:
        curr_date = (datetime.now() - timedelta(1)).strftime('%Y-%m-%d')
        
    Quotations_Created_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users} and e.`cloned_source_type` = 'USER'"
    Unqiue_Users_Creating_Quotation_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users} and e.`cloned_source_type` = 'USER'"
    Unique_Users_Sharing_Quotation_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`updated_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users}"
    Total_Quotations_Created_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users} and e.`cloned_source_type` = 'USER'"
    Total_Unique_Users_Creating_Quotations_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users} and e.`cloned_source_type` = 'USER'"
    Total_Unique_Users_Sharing_Quotations_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`updated_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users}"
    Get_Last_Total_Quotation_query = "SELECT `total_quotations_shared` as Count FROM shield.`quotation_generator_analytics` ORDER BY dqg_date DESC LIMIT 1;"
    # Refactor Queries --------------------------
    Quotations_Shared_query = f"select Count(*) as Count from (select e.estimator_id, min(e.updated_at), CURRENT_DATE AS today, CASE WHEN MIN(e.updated_at) between '{curr_date}  00:00:00'  and '{curr_date}  23:59:59' THEN 'Match' ELSE 'No Match' END AS date_status FROM vishanti.estimator_history e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id WHERE status = 'FINALIZED' and ul.role_id = 1 and e.`user_id`  NOT IN{internal_users} GROUP BY estimator_id)tmp where tmp.date_status='MATCH';"
    Total_Quotations_Shared_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`updated_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN{internal_users}"
    reshared_count_query = f"select count(distinct eh.estimator_id) as Count from vishanti.estimator_history eh left join ( select distinct estimator_id from vishanti.estimator_history e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where e.status='FINALIZED' and ul.role_id = 1 and e.`user_id`  NOT IN{internal_users} and e.updated_at between '{curr_date} 00:00:00' AND '{curr_date} 23:59:59' ) tmp on eh.estimator_id=tmp.estimator_id where status='FINALIZED' and updated_at < '{curr_date} 00:00:00' and tmp.estimator_id is not null;"
    dp_created_query = f"SELECT COUNT(*) AS Count FROM cms.digital_profiles dp left join shield.`app_user_role_mapping` ul on dp.`contractor_uuid` = ul.user_id WHERE dp.created_at between '{curr_date} 00:00:00' AND '{curr_date} 23:59:59' and ul.role_id = 1 and dp.`contractor_uuid`  NOT IN{internal_users};"
    unique_Users_creating_dp_query =  f"SELECT COUNT(DISTINCT created_by_user_id) AS Count FROM cms.digital_profiles left join shield.`app_user_role_mapping` ul on dp.`contractor_uuid` = ul.user_id WHERE dp.created_at between '{curr_date} 00:00:00' AND '{curr_date} 23:59:59' and ul.role_id = 1 and dp.`contractor_uuid` NOT IN{internal_users};"
    total_dp_created_query = f"SELECT COUNT(*) AS Count FROM cms.digital_profiles dp left join shield.`app_user_role_mapping` ul on dp.`contractor_uuid` = ul.user_id WHERE dp.created_at <= '{curr_date} 23:59:59' and ul.role_id = 1 and dp.`contractor_uuid`  NOT IN{internal_users};"
    total_unique_Users_creating_dp_query = f"SELECT COUNT(DISTINCT created_by_user_id) AS Count FROM cms.digital_profiles left join shield.`app_user_role_mapping` ul on dp.`contractor_uuid` = ul.user_id WHERE dp.created_at <= '{curr_date} 23:59:59' and ul.role_id = 1 and dp.`contractor_uuid`  NOT IN{internal_users};"
    # End ----------------------------------------------

    #New_Query= f"WITH LatestEstimator AS ( SELECT e.estimator_id, e.updated_at, ROW_NUMBER() OVER (PARTITION BY e.estimator_id ORDER BY e.updated_at DESC) AS rn FROM vishanti.estimator_history e LEFT JOIN shield.app_user_role_mapping ul ON e.user_id = ul.user_id WHERE ul.role_id = 1 AND e.status IN ('FINALIZED') AND e.updated_at BETWEEN '{curr_date} 00:00:00' AND '{curr_date} 23:59:59' AND e.user_id NOT IN{internal_users} ) SELECT COUNT(DISTINCT estimator_id) AS Count FROM LatestEstimator;"
    # Total_Quotations_Shared_query = Get_Last_Total_Quotation + Quotations_Shared_query;

    #-------------------------------------
     
    # print(f'{Quotations_Created_query}')
    # print(f'{Unqiue_Users_Creating_Quotation_query}')
    # print(f'{Quotations_Shared_query}')
    # print(f'{Unique_Users_Sharing_Quotation_query}')
    # print(f'{Total_Quotations_Created_query}')
    # print(f'{Total_Quotations_Shared_query}')
    # print(f'{Total_Unique_Users_Creating_Quotations_query}')
    # print(f'{Total_Unique_Users_Sharing_Quotations_query}')

    try :
        #db_config = get_db_config('local')
        Quotations_Created = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Quotations_Created_query)])[0]
        Unqiue_Users_Creating_Quotation = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Unqiue_Users_Creating_Quotation_query)])[0]
        Unique_Users_Sharing_Quotation = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Unique_Users_Sharing_Quotation_query)])[0]
        Total_Quotations_Created = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Quotations_Created_query)])[0]
        Total_Unique_Users_Creating_Quotations = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Unique_Users_Creating_Quotations_query)])[0]
        Total_Unique_Users_Sharing_Quotations = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Unique_Users_Sharing_Quotations_query)])[0]
        reshared_count = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, reshared_count_query)])[0]
        dp_created = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, dp_created_query)])[0]
        unique_Users_creating_dp = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, unique_Users_creating_dp_query)])[0]
        total_dp_created = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, total_dp_created_query)])[0]
        total_unique_Users_creating_dp = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, total_unique_Users_creating_dp_query)])[0]
        # ---------------
        Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Quotations_Shared_query)])[0]
        #Total_Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Quotations_Shared_query)])[0]
        #Get_Last_Total_Quotation = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Get_Last_Total_Quotation_query)])[0]
        #db_config_local =  get_db_config('local')
        #--------------------
        if start_date is not None and start_date == curr_date:
            Total_Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Quotations_Shared_query)])[0]
        else:
            #Total_Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config_local, Get_Last_Total_Quotation_query)])[0] + Quotations_Shared
            Total_Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Get_Last_Total_Quotation_query)])[0] + Quotations_Shared
        #--------------------

        data = [curr_date, Quotations_Created, Unqiue_Users_Creating_Quotation, Quotations_Shared, Unique_Users_Sharing_Quotation, Total_Quotations_Created, Total_Quotations_Shared, Total_Unique_Users_Creating_Quotations, Total_Unique_Users_Sharing_Quotations, reshared_count, dp_created, unique_Users_creating_dp, total_dp_created, total_unique_Users_creating_dp]
        return data
    except mysql.connector.Error as err:
        print(f"Error copying customer data: {err}")

def create_cron_data_table(db_config, destination_table):
    try:
        # Connect to destination database
        dest_conn = mysql.connector.connect(**db_config)
        dest_cursor = dest_conn.cursor()

        # Check if destination table exists
        dest_cursor.execute(f"SHOW TABLES LIKE '{destination_table}'")
        table_exists = dest_cursor.fetchone()

        if not table_exists:
            # Table doesn't exist; create it
            create_table_query = (
                f"CREATE TABLE {destination_table} ("
                "dqg_date date DEFAULT NULL,"
                "quotations_created bigint unsigned DEFAULT NULL,"
                "unqiue_users_creating_quotation bigint unsigned DEFAULT NULL,"
                "quotations_shared bigint unsigned DEFAULT NULL,"
                "unique_users_sharing_quotation bigint unsigned DEFAULT NULL,"
                "total_quotations_created bigint unsigned DEFAULT NULL,"
                "total_quotations_shared bigint unsigned DEFAULT NULL,"
                "total_unique_users_creating_quotations bigint unsigned DEFAULT NULL,"
                "total_unique_users_sharing_quotations bigint unsigned DEFAULT NULL,"
                "UNIQUE KEY `dqg_date_constraint` (`dqg_date`)"
                ");"
            )
            dest_cursor.execute(create_table_query)
            #print(f"Created table '{destination_table}' in '{db_config['database']}'.")

        # Commit creation of table (if created) or proceed if table exists
        dest_conn.commit()

    except mysql.connector.Error as err:
        print(f"Error creating table or checking existence: {err}")

    finally:
        # Close connections
        if 'dest_conn' in locals() and dest_conn.is_connected():
            dest_cursor.close()
            dest_conn.close()

def convert(date_time): 
    format = '%Y-%m-%d'
    datetime_str = datetime.strptime(date_time, format).date()
    return datetime_str 

def main(environment_name, startDate, endDate):
    try : 
        db_config = get_db_config(environment_name)
        create_cron_data_table(db_config, destination_table)
        columns = ['dqg_date', 'quotations_created', 'unqiue_users_creating_quotation', 'quotations_shared', 'unique_users_sharing_quotation', 'total_quotations_created', 'total_quotations_shared', 'total_unique_users_creating_quotations', 'total_unique_users_sharing_quotations', 'reshared_count', 'digital_profiles_created', 'unique_users_creating_digital_profiles', 'total_digital_profiles', 'total_unique_users_creating_digital_profiles']
        if endDate:
            start = convert(startDate)
            end = convert(endDate)   
            backfill_data(start , end, db_config, destination_table, columns, environment_name)
        else:
            insert_data_into_table(fetch_excel_data(db_config, (datetime.now() - timedelta(1)).strftime('%Y-%m-%d'), None , environment_name), destination_table, columns, db_config)

        all_data = []
        fetch_all_data_query = f"Select dqg_date, quotations_created, unqiue_users_creating_quotation, quotations_shared, unique_users_sharing_quotation, total_quotations_created, total_quotations_shared, total_unique_users_creating_quotations, total_unique_users_sharing_quotations,reshared_count,total_dps_created, unique_users_creating_dp, cumulative_dps_created,cumulative_unique_users from {destination_table}"
        db_config = get_db_config('local')
        data = fetch_data_from_db(db_config, fetch_all_data_query)
        all_data.extend(data)

        generate_excel(data,filename)
        send_email_with_attachment(filename, environment_name)
    except mysql.connector.Error as err:
        print(f"Error copying customer data: {err}")


# Main script
if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_name, args.date)
    # 2024-07-22 , 2024-08-05
#main('prod',None, None)
main('local', '2024-07-22' , '2024-10-09')

