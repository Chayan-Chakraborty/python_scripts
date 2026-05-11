"""
New Cron Sheet(QG Dashboard)
Columns : 
User Number,User Name,Quotation State,Quotation City,Quotation ID,Project ID,Contractor Type,ProjectCreatedDate	,QuotationCreatedDate,QuotationUpdatedDate,Quotation Type,Qutation Status,Quotation Value,Quotation Room Count,	Quotation Item Count,User Category,	Quotation Creation Type
"""


from datetime import date, datetime, timedelta
# import importli
# import sys
import mysql.connector
# from openpyxl import Workbook
import pandas
import importlib
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging
import sys

db_configs = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'shield',
        'port' : 3306
    },
    'prod':{
        'user': 'solstice_admin',
        'password': 'MrVr3pyh9SsQ32usWtBK',
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

email_configs = {
    'local': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'QG-Dashboard-Cron-Data({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        # 'to_emails': ['chayan.chakraborty@pidilite.vc', 'chinmay.jaripatke@pidilite.vc', 'ahona@pidilite.vc', 'anil@pidilite.vc', 'deepak.agarwal@pidilite.vc', 'varsha.singh@pidilite.vc'],  # List of recipients`
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients`
        'subject': f'QG-Dashboard-Cron-Data({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    }
}

queries = {
    'fetch_users' : 'SELECT username FROM shield.app_user_v2'
}

def get_emial_config(name):
    return email_configs.get(name)

def get_internal_users(module_path, filename, environment_name):
    # Load the module
    spec = importlib.util.spec_from_file_location(filename, module_path)
    internal_user_script = importlib.util.module_from_spec(spec)
    sys.modules[filename] = internal_user_script
    spec.loader.exec_module(internal_user_script)

    # Now you can use functions or classes from your_script
    internal_user_script.main(environment_name)

    return internal_user_script.main(environment_name)

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

def get_db_config(name):
    return db_configs.get(name)

def generate_excel(data, filename):
    df = pandas.DataFrame(data)
    df.to_excel(filename, index=False)

# Function to send an email with the Excel attachment
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

def main(environment_name):
    db_config = get_db_config(environment_name)
    #batch_fill_fcc_data(db_config, environment_name)

    all_data = []

    module_path = '/Users/chayanchakraborty/Documents/python_env/prod-crons'
    filename = "FetchInternalUser"
    internal_users = get_internal_users(module_path, filename, environment_name)

    data_query = f"""WITH estimator_data AS ( SELECT sau.username AS 'user_number', sau.`created_at` as Profile_Created_Date  , sau.name AS 'username', za.city, za.state, ve.project_id, ve.user_id, ve.id AS 'quotation_id', zp.start_date AS 'start_date', ve.created_at AS 'created_at', ve.updated_at AS 'updated_at', ve.type AS 'type', ve.status AS 'status', ve.amount AS 'amount', ve.parent_estimator_id, COUNT(DISTINCT vr.id) AS 'room_count', COUNT(DISTINCT vi.id) AS 'item_count', CASE WHEN ve.parent_estimator_id IS NOT NULL THEN 'Cloned' ELSE 'New' END AS creation_type FROM vishanti.estimator ve LEFT JOIN shield.app_user_v2 sau ON ve.user_id = sau.id LEFT JOIN zeus.project zp ON ve.project_id = zp.id LEFT JOIN zeus.address za ON zp.id = za.project_id AND zp.org_id = za.org_id LEFT JOIN vishanti.room vr ON ve.id = vr.estimator_id LEFT JOIN vishanti.item vi ON vr.id = vi.room_id GROUP BY sau.username, sau.name, za.city, za.state, ve.project_id, ve.id, zp.start_date, ve.created_at, ve.updated_at, ve.type, ve.status, ve.amount ),user_type_data AS ( SELECT sau.username AS 'username', ve.user_id, MAX(ve.status) AS last_status, MAX(ve.created_at) AS last_created_at, CASE WHEN MAX(ve.status) = 'finalized' THEN CASE WHEN TIMESTAMPDIFF( DAY, MAX(ve.created_at), NOW() ) <= 30 THEN 'Repeat' WHEN TIMESTAMPDIFF( DAY, MAX(ve.created_at), NOW() ) BETWEEN 31 AND 180 THEN 'Existing' ELSE 'Inactive' END ELSE 'New' END AS user_type FROM vishanti.estimator ve INNER JOIN shield.app_user_v2 sau ON ve.user_id = sau.id GROUP BY sau.username, ve.user_id ),fcc_user AS ( SELECT u.username as 'username', fup.`bd_namer` as 'bd_name', fup.`bd_mobile_number` as 'bd_number', CASE WHEN fup.user_id IS NOT NULL THEN 'FCC' ELSE 'Non-FCC' END AS contractor_type FROM app_user_v2 u LEFT JOIN fcc_user_profile fup ON u.id = fup.user_id )SELECT eud.user_number AS 'User Number', eud.username AS 'Username', eud.city, eud.state, eud.project_id, eud.quotation_id AS 'Quotation ID', eud.start_date AS 'Project Start Date', eud.created_at AS 'Quotation Created Date', eud.updated_at AS 'Quotation Updated Date', eud.Profile_Created_Date as 'Profile_Created_Date' , eud.type AS 'Quotation Type', eud.status AS 'Quotation Status', eud.amount AS 'Quotation Amount', eud.room_count AS 'Room Count', eud.item_count AS 'Item Count', rd.user_type AS 'User Type', fcc.contractor_type AS 'Contractor Type', eud.creation_type AS 'Quotation Creation Type', fcc.bd_name as 'BD Name', fcc.bd_number as 'BD Number' FROM estimator_data eud LEFT JOIN user_type_data rd ON eud.user_id = rd.user_id LEFT JOIN fcc_user fcc on eud.user_number = fcc.username Where eud.user_id NOT IN{internal_users};"""

    # Fetch data from each database
    data =  fetch_data_from_db(db_config, data_query)
    all_data.extend(data)

    filename = 'QG-Dashboard-Cron-Data.xlsx'
    generate_excel(all_data, filename)
    send_email_with_attachment(filename, environment_name)
    print('Email sent successfully with the Excel attachment.')

# Main script

if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment_nameironment name.')
    # parser.add_argument('environment_nameironment_name', type=str, help='environment_nameironment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_nameironment_name)
main('prod')


