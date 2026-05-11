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

"""
New Cron Sheet(Procurement Dashboard)
Columns : 
User ID ,Name, Number,Quotations created,Quotations shared,Quotation Created Amount,Quotation Finalized Amount,	Enquiries till date	,Enquiries amount till date	,Orders till date	,Order amount till date	,Txn amount till date
"""

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
        'subject': f'Procurement-Dashboard-Cron-Data({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc', 'chinmay.jaripatke@pidilite.vc', 'ahona@pidilite.vc', 'anil@pidilite.vc', 'deepak.agarwal@pidilite.vc', 'varsha.singh@pidilite.vc'],  # List of recipients
        'subject': f'Procurement-Dashboard-Cron-Data({(datetime.now()).strftime("%Y-%m-%d")})',
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
    query = f"WITH vishanti_shield_data AS (SELECT e.user_id, u.username AS number, u.NAME AS NAME, Count(CASE WHEN e.status IN ( 'FINALIZED', 'DRAFT' ) THEN 1 END) AS quotations_created, Count(CASE WHEN e.status = 'FINALIZED' THEN 1 END) AS quotations_shared, Sum(CASE WHEN e.status IN ( 'FINALIZED', 'DRAFT' ) THEN e.total_amount END)   AS quotation_created_amount, Sum(CASE WHEN e.status = 'FINALIZED' THEN e.total_amount END)   AS quotation_finalized_amount FROM   vishanti.estimator e JOIN shield.app_user_v2 u ON e.user_id = u.id GROUP  BY e.user_id, u.username, u.NAME), magneto_data AS (SELECT COALESCE(e.user_id, o.user_id)   AS user_id, COALESCE(Sum(e.total_amount), 0) AS enquiries_amount_till_date, COALESCE(Count(e.user_id), 0)    AS enquiries_till_date, COALESCE(Sum(o.total_amount), 0) AS order_amount_till_date, COALESCE(Count(o.user_id), 0)    AS order_till_date FROM   magneto.enquiry e LEFT JOIN magneto.orders o ON e.user_id = o.user_id WHERE e.user_id NOT IN{(internal_users)} GROUP  BY COALESCE(e.user_id, o.user_id)), kuber_data AS (SELECT u.user_id, Sum(p.amount) AS txn_amount_till_date FROM   magneto.orders u JOIN kuber.payment_expectation p ON u.external_id = p.order_external_id WHERE  p.status = 'COMPLETE' GROUP  BY u.user_id) SELECT vsd.user_id, vsd.number, vsd.NAME, vsd.quotations_created, vsd.quotations_shared, vsd.quotation_created_amount, vsd.quotation_finalized_amount, md.enquiries_amount_till_date, md.enquiries_till_date, md.order_amount_till_date, md.order_till_date, COALESCE(kd.txn_amount_till_date, 0) AS txn_amount_till_date FROM   vishanti_shield_data vsd JOIN magneto_data md ON vsd.user_id = md.user_id LEFT JOIN kuber_data kd ON vsd.user_id"
    all_data = []

    db_config = get_db_config(environment_name)

    # Fetch data from each database
    data = fetch_data_from_db(db_config, query)
    all_data.extend(data)

    filename = 'Procurement-Dashboard-Cron-Data.xlsx'
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
