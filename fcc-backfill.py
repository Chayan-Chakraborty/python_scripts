"""
New Cron Sheet(QG Dashboard)
Columns : 
User Number,User Name,Quotation State,Quotation City,Quotation ID,Project ID,Contractor Type,ProjectCreatedDate	,QuotationCreatedDate,QuotationUpdatedDate,Quotation Type,Qutation Status,Quotation Value,Quotation Room Count,	Quotation Item Count,User Category,	Quotation Creation Type
"""


from asyncio import Timeout
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

import requests

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

api_hosts = {
    'local' : 'http://localhost:8082',
    'dev' : 'http://ecs-dev-public-alb-878955395.ap-south-1.elb.amazonaws.com:81',
    'uat' : 'http://localhost:8001',
    'prod' : 'http://prod-vishanti-elb-306674393.ap-south-1.elb.amazonaws.com'
}

batch_size = 500

internal_user = {
    'local' : 338,
    'dev' : 338,
    'uat' : 386,
    'prod' : 402
}

email_configs = {
    'local': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': 'Order Cron',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'QG-DASHBOARD-CRON-DATA({(datetime.now() - timedelta(0)).strftime('%Y-%m-%d')})',
        'body': 'Please find the attached Excel file with the data.'
    }
}

queries = {
    'fetch_users' : 'SELECT u.username FROM app_user_v2 u LEFT JOIN fcc_user_profile fup ON u.id = fup.user_id WHERE fup.user_id IS NULL;'
}

api_paths = {
    'genrate_auth_url' : '/v2/api/auth/generate-token',
    'fetch_fcc_profile' : '/v1/api/fcc'
}

def get_emial_config(name):
    return email_configs.get(name)

def get_internal_users(module_path, filename):
    # Load the module
    spec = importlib.util.spec_from_file_location(filename, module_path)
    internal_user_script = importlib.util.module_from_spec(spec)
    sys.modules[filename] = internal_user_script
    spec.loader.exec_module(internal_user_script)

    # Now you can use functions or classes from your_script
    internal_user_script.main()

    return internal_user_script.main()

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

def build_api_url(environment_name, api_path):
    return f'{api_hosts[environment_name]}{api_path}'

def genrate_static_auth_token(environment_name):
    try:
        response = requests.get(build_api_url(environment_name, api_paths['genrate_auth_url']),headers={"X-CHANNEL": 'CONTRACTOR_WEB'})
        return response.headers["access_token"]

    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print(e)
        raise e

    except Exception as e:
        print(e)
        # Handle any other unexpected error
        raise e

def fetch_users_in_batches(db_config, batch_size, query):
    logging.info(f"Connecting to database: {db_config['database']} at {db_config['host']}:{db_config['port']}")
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor(dictionary=True)
    cursor.execute(query)
    while True:
        batch = cursor.fetchmany(batch_size)
        if not batch:
            break
        yield [row[0] for row in batch]

def fill_fcc_data(environment_name, auth_token, phone_numbers):

    payload = {
        "phoneNo": phone_numbers,
        "sync": True
    }
    
    api_headers = {
    'Content-Type': 'application/json',
    'Authorization': f'Bearer {auth_token}',
    'X-USER-ROLE': 'ADMIN',
    'X-CHANNEL': 'ADMIN_WEB',
    'X-USER-ROLE': 'ADMIN',
    'X-USER-NAME': '9972217722' #needed to be changed
    } 
    
    try:
        api_url = build_api_url(environment_name,api_paths['fetch_fcc_profile'])
        response = requests.post(api_url, json=payload, headers=api_headers)
        response.raise_for_status()  # Raise an HTTPError for bad responses
        print(f"Successfully sent {len(phone_numbers)} numbers.")
    except requests.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    except ConnectionError as conn_err:
        print(f"Connection error occurred: {conn_err}")
    except Timeout as timeout_err:
        print(f"Request timed out: {timeout_err}")
    except requests.RequestException as req_err:
        print(f"An error occurred: {req_err}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def batch_fill_fcc_data(db_config, environment_name):
    auth_token =  genrate_static_auth_token(environment_name) #generate static auth
    for batch in fetch_users_in_batches(db_config, batch_size, queries['fetch_users']):
        fill_fcc_data(environment_name, auth_token, batch)

def generate_excel(data, filename):
    df = pd.DataFrame(data)
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

    module_path = '/Users/chayanchakraborty/Documents/python_env/new_env/FetchInternalUser.py'
    filename = "FetchInternalUser"
    internal_users = get_internal_users(module_path, filename)

    data_query = f"""WITH estimator_data AS ( SELECT sau.username AS 'user_number', sau.name AS 'username', za.city, za.state, ve.project_id, ve.user_id, ve.id AS 'quotation_id', zp.start_date AS 'start_date', ve.created_at AS 'created_at', ve.updated_at AS 'updated_at', ve.type AS 'type', ve.status AS 'status', ve.amount AS 'amount', ve.parent_estimator_id, COUNT(DISTINCT vr.id) AS 'room_count', COUNT(DISTINCT vi.id) AS 'item_count', CASE WHEN ve.parent_estimator_id IS NOT NULL THEN 'Cloned' ELSE 'New' END AS creation_type FROM vishanti.estimator ve LEFT JOIN shield.app_user_v2 sau ON ve.user_id = sau.id LEFT JOIN zeus.project zp ON ve.project_id = zp.id LEFT JOIN zeus.address za ON zp.id = za.project_id AND zp.org_id = za.org_id LEFT JOIN vishanti.room vr ON ve.id = vr.estimator_id LEFT JOIN vishanti.item vi ON vr.id = vi.room_id GROUP BY sau.username, sau.name, za.city, za.state, ve.project_id, ve.id, zp.start_date, ve.created_at, ve.updated_at, ve.type, ve.status, ve.amount ), user_type_data AS ( SELECT sau.username AS 'username', ve.user_id, MAX(ve.status) AS last_status, MAX(ve.created_at) AS last_created_at, CASE WHEN MAX(ve.status) = 'finalized' THEN CASE WHEN TIMESTAMPDIFF(DAY, MAX(ve.created_at), NOW()) <= 30 THEN 'Repeat' WHEN TIMESTAMPDIFF(DAY, MAX(ve.created_at), NOW()) BETWEEN 31 AND 180 THEN 'Existing' ELSE 'Inactive' END ELSE 'New' END AS user_type FROM vishanti.estimator ve INNER JOIN shield.app_user_v2 sau ON ve.user_id = sau.id GROUP BY sau.username, ve.user_id ), fcc_user AS ( SELECT u.username as 'username', CASE WHEN fup.user_id IS NOT NULL THEN 'FCC' ELSE 'Non-FCC' END AS contractor_type FROM app_user_v2 u LEFT JOIN fcc_user_profile fup ON u.id = fup.user_id ) SELECT eud.user_number AS 'User Number', eud.username AS 'Username', eud.city, eud.state, eud.project_id, eud.quotation_id AS 'Quotation ID', eud.start_date AS 'Project Start Date', eud.created_at AS 'Quotation Created Date', eud.updated_at AS 'Quotation Updated Date', eud.type AS 'Quotation Type', eud.status AS 'Quotation Status', eud.amount AS 'Quotation Amount', eud.room_count AS 'Room Count', eud.item_count AS 'Item Count', rd.user_type AS 'User Type', fcc.contractor_type AS 'Contractor Type', eud.creation_type AS 'Quotation Creation Type' FROM estimator_data eud LEFT JOIN user_type_data rd ON eud.user_id = rd.user_id LEFT JOIN fcc_user fcc on  eud.user_number=fcc.username Where eud.user_id NOT IN ({internal_users});"""

    # Fetch data from each database
    data =  fetch_data_from_db(db_config, data_query)
    all_data.extend(data)

    filename = 'data_export.xlsx'
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
