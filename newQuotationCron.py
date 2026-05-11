from datetime import datetime
import importlib
import mysql.connector
import pandas as pd
from openpyxl import Workbook
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging
import sys

# Database configurations
db_configs = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'magneto',
        'port' : 3306
    },
    'prod':{
        'user': 'cron_read_user',
        'password': 'J5drbt7yHT8NAj4',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'magneto',
        'port' : 3306
    }
    # Add more databases as needed
}

def get_internal_users(module_path, filename, environment_name):
    # Load the module
    spec = importlib.util.spec_from_file_location(filename, module_path)
    internal_user_script = importlib.util.module_from_spec(spec)
    sys.modules[filename] = internal_user_script
    spec.loader.exec_module(internal_user_script)

    # Now you can use functions or classes from your_script
    internal_user_script.main(environment_name)

    return internal_user_script.main(environment_name)

def get_db_config(name):
    return db_configs.get(name)

# Email configuration
email_configs = {
    'local': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'Quotation-Dashboard-Cron-Data',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        #'to_emails': ['chayan.chakraborty@pidilite.vc', 'chinmay.jaripatke@pidilite.vc', 'ahona@pidilite.vc', 'anil@pidilite.vc', 'deepak.agarwal@pidilite.vc', 'varsha.singh@pidilite.vc'],  # List of recipients
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'Quotation-Dashboard-Cron-Data',
        'body': 'Please find the attached Excel file with the data.'
    }
}

module_env_path = {
    'local' :  '/Users/chayanchakraborty/Documents/python_new_dir/FetchInternalUser.py',
    'prod' :  '/Users/chayanchakraborty/Documents/python_new_dir/FetchInternalUser.py'
}

def get_emial_config(name):
    return email_configs.get(name)

# Function to fetch data from a database
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

# Function to generate an Excel file from data
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
    module_path = module_env_path[environment_name]
    filename = "FetchInternalUser"
    internal_users = get_internal_users(module_path, filename,environment_name)
    query = f"with quotation_created as ( select e.user_id, COUNT(e.id) AS created_count from vishanti.estimator e left join shield.`app_user_role_mapping` aurm on e.user_id=aurm.`user_id` left join zeus.address a on e.project_id=a.project_id where aurm.`role_id`=1 and a.city like 'Bangal%' or city like 'Bengalu%' and e.status='DRAFT' group by e.user_id ), quotation_shared as ( select e.user_id, COUNT(e.id) AS shared_count from vishanti.estimator e left join shield.`app_user_role_mapping` aurm on e.user_id=aurm.`user_id` left join zeus.address a on e.project_id=a.project_id where aurm.`role_id`=1 and a.city like 'Bangal%' or city like 'Bengalu%' and e.status='FINALIZED' group by e.user_id ),fcc_user AS ( SELECT fup.`bd_namer` , fup.`bd_mobile_number`, u.id as 'contractor_id', fup.city FROM shield.app_user_v2 u left join shield.`app_user_role_mapping` aurm on u.id=aurm.`user_id` LEFT JOIN shield.fcc_user_profile fup ON u.id = fup.user_id where aurm.`role_id`=1 and fup.`city` like 'Bangal%' or city like 'Bengalu%' ), client_details as ( SELECT u.id as 'user_id', a.city FROM shield.app_user_v2 u left join shield.`app_user_role_mapping` aurm on u.id=aurm.`user_id` LEFT JOIN zeus.organization_owner oo ON u.id = oo.owner_user_id LEFT JOIN zeus.address a ON oo.org_id = a.org_id WHERE aurm.`role_id`=1 and a.project_id IS NULL and (a.city LIKE 'Bangal%' or a.city LIKE 'Bengalu%') ) select u.name as 'Contractor Name', u.username as 'Contractor Number' , qc.created_count as 'Quotation Created', qs.shared_count as 'Quotation Shared', fu.bd_namer as 'BD NAME', fu.bd_mobile_number as 'BD NUMBER', cd.city as 'Business City' from shield.app_user_v2 u left join shield.`app_user_role_mapping` aurm on u.id=aurm.`user_id` left join quotation_created qc on u.id=qc.user_id left join quotation_shared qs on u.id=qs.user_id left join `fcc_user` fu on fu.contractor_id = u.id left join client_details cd on u.id=cd.user_id where aurm.`role_id`=1 and u.id NOT IN{internal_users}"
    
    all_data = []

    db_config = get_db_config(environment_name)

    # Fetch data from each database
    data = fetch_data_from_db(db_config, query)
    all_data.extend(data)

    filename = 'New Quotation Cron.xlsx'
    generate_excel(all_data, filename)
    send_email_with_attachment(filename, environment_name)

# Main script

if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_name)
main('prod')
