from aifc import Error
from datetime import date, datetime, timedelta
import mysql.connector
import pandas as pd
from openpyxl import Workbook
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging


filename = 'quotation_cron_report.xlsx'

destination_table = 'dqg_cron_data'
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
        'user': 'cron_read_user',
        'password': 'J5drbt7yHT8NAj4',
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

internal_headers = ['Date', 'Quotations Created', 'Unqiue Users Creating Quotation', 'Quotations Shared', 'Unique Users Sharing Quotation', 'Total Quotations Created', 'Total Quotations Shared', 'Total_Unique_Users_Creating_Quotations', 'Total_Unique_Users_Sharing_Quotations']

internal_users = "1286,371,538,464,5371,5324,5317,5397,561,5299,420,419,558,5298,1263,1288,421,372,5362,5308,5305,5307,5310,5306,5309,546,5361,3447,405,388,467,1287,2495,5326,483,408,5381,4204,480,5347,5301,5291,5297,5373,5295,5293,5374,5372,5294,5296,5375,5343,5345,5344,5342,5349,5346,5348,5350,5304,5302,3452,406,5382,5357,5369,5406,5388,556,5391,651,5402,5396,5403,5384,5284,660,2564,5401,810,2200,5399,5408,5404,5405,5400,5392,5393,5394,5395,5398,5300,5303,5380,5351,5370,5356,5358,5379,5352,5365,5367,5368,5366,5353,5378,5354,5355,5359,5377,5327,5331,5330,5407,5329,5328,5335,5336,5332,5334,5337,5311,5313,5319,5312,5314,5316,5315,5318,5323,5340,5339,5341,5338,481,366,367,781,5320,5322,5321,4402,5390,5387,5386,5389,5383,5279,5385,1577,513,418,524,536,655,386,701,466,4684,571,1814,474,1289,437,5376,3637,3639,926,364,696,5325,610,759,628,4791,365,5292,409,392,5333,491,3930,374,1578,2848,375,534,1519,368,5363,5364,369,5360,541,1234"


email_configs = {
    'local': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'QUOTATION-CRON-DATA({(datetime.now() - timedelta(1)).strftime('%Y-%m-%d')})',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
         'subject': f'QUOTATION-CRON-TEST-DATA({(datetime.now() - timedelta(1)).strftime('%Y-%m-%d')})',
        'body': 'Please find the attached Excel file with the data.'
    }
}

def get_emial_config(name):
    return email_configs.get(name)

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
        print(f"Inserted {cursor.rowcount} rows into {table_name}.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

def backfill_data(start , end, db_config, destination_table, columns):
    res_date = start
    while res_date <= end:
        insert_data_into_table(fetch_excel_data(db_config, res_date), destination_table, columns, db_config)
        res_date += timedelta(days=1)
    
def fetch_excel_data(db_config , curr_date):
    if curr_date is None:
        curr_date = (datetime.now() - timedelta(1)).strftime('%Y-%m-%d')
    Quotations_Created_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Unqiue_Users_Creating_Quotation_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Quotations_Shared_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`created_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Unique_Users_Sharing_Quotation_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`created_at` between '{curr_date} 00:00:00'  and '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Total_Quotations_Created_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Total_Quotations_Shared_query = f"Select Count(*) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`created_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Total_Unique_Users_Creating_Quotations_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('DRAFT','FINALIZED') and e.`created_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"
    Total_Unique_Users_Sharing_Quotations_query = f"Select Count(Distinct(e.user_id)) as Count from vishanti.estimator e left join shield.`app_user_role_mapping` ul on e.user_id = ul.user_id where ul.role_id = 1 and  e.status IN ('FINALIZED') and e.`created_at` <= '{curr_date} 23:59:59' and e.`user_id`  NOT IN({internal_users})"

    try :
        db_config = get_db_config('prod')
        Quotations_Created = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Quotations_Created_query)])[0]
        Unqiue_Users_Creating_Quotation = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Unqiue_Users_Creating_Quotation_query)])[0]
        Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Quotations_Shared_query)])[0]
        Unique_Users_Sharing_Quotation = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Unique_Users_Sharing_Quotation_query)])[0]
        Total_Quotations_Created = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Quotations_Created_query)])[0]
        Total_Quotations_Shared = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Quotations_Shared_query)])[0]
        Total_Unique_Users_Creating_Quotations = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Unique_Users_Creating_Quotations_query)])[0]
        Total_Unique_Users_Sharing_Quotations = ([id_tuple['Count'] for id_tuple in fetch_data_from_db(db_config, Total_Unique_Users_Sharing_Quotations_query)])[0]
        data = [curr_date, Quotations_Created, Unqiue_Users_Creating_Quotation, Quotations_Shared, Unique_Users_Sharing_Quotation, Total_Quotations_Created, Total_Quotations_Shared, Total_Unique_Users_Creating_Quotations, Total_Unique_Users_Sharing_Quotations]
        return data
    except mysql.connector.Error as err:
        print(f"Error copying customer data: {err}")

def create_cron_data_table(db_config, destination_table):
    try:
        # Connect to destination database
        db_config = get_db_config('local')
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
            print(f"Created table '{destination_table}' in '{db_config['database']}'.")

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
        columns = ['dqg_date', 'quotations_created', 'unqiue_users_creating_quotation', 'quotations_shared', 'unique_users_sharing_quotation', 'total_quotations_created', 'total_quotations_shared', 'total_unique_users_creating_quotations', 'total_unique_users_sharing_quotations']
        if endDate:
            start = convert(startDate)
            end = convert(endDate)   
            backfill_data(start , end, db_config, destination_table, columns)
        else:
            insert_data_into_table(fetch_excel_data(db_config, (datetime.now() - timedelta(1)).strftime('%Y-%m-%d')), destination_table, columns, db_config)

        all_data = []
        fetch_all_data_query = f"Select dqg_date, quotations_created, unqiue_users_creating_quotation, quotations_shared, unique_users_sharing_quotation, total_quotations_created, total_quotations_shared, total_unique_users_creating_quotations, total_unique_users_sharing_quotations from {destination_table}"
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
main('local','2024-07-22' , '2024-08-12')
