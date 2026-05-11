import mysql.connector
import pandas as pd
from openpyxl import Workbook
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging

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
        'subject': 'Order Cron',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['anil@pidilite.vc'],  # List of recipients
        'subject': 'Procurement Dashboard Cron',
        'body': 'Please find the attached Excel file with the data.'
    }
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
    query = "WITH vishanti_shield_data AS ( SELECT e.user_id, u.username AS number, u.name AS name, COUNT(CASE WHEN e.status IN ('FINALIZED', 'DRAFT') THEN 1 END) AS quotations_created, COUNT(CASE WHEN e.status = 'FINALIZED' THEN 1 END) AS quotations_shared, SUM(CASE WHEN e.status IN ('FINALIZED', 'DRAFT') THEN e.total_amount END) AS quotation_created_amount, SUM(CASE WHEN e.status = 'FINALIZED' THEN e.total_amount END) AS quotation_finalized_amount FROM vishanti.estimator e JOIN shield.app_user_v2 u ON e.user_id = u.id GROUP BY e.user_id, u.username, u.name ), magneto_data AS ( SELECT COALESCE(e.user_id, o.user_id) AS user_id, COALESCE(SUM(e.total_amount), 0) AS enquiries_amount_till_date, COALESCE(COUNT(e.user_id), 0) AS enquiries_till_date, COALESCE(SUM(o.total_amount), 0) AS order_amount_till_date, COALESCE(COUNT(o.user_id), 0) AS order_till_date FROM magneto.enquiry e LEFT JOIN magneto.orders o ON e.user_id = o.user_id GROUP BY COALESCE(e.user_id, o.user_id) ), kuber_data AS ( SELECT u.user_id, SUM(p.amount) AS txn_amount_till_date FROM magneto.orders u JOIN kuber.payment_expectation p ON u.external_id = p.order_external_id WHERE p.status = 'COMPLETE' GROUP BY u.user_id ) SELECT vsd.user_id, vsd.number, vsd.name, vsd.quotations_created, vsd.quotations_shared, vsd.quotation_created_amount, vsd.quotation_finalized_amount, md.enquiries_amount_till_date, md.enquiries_till_date, md.order_amount_till_date, md.order_till_date, COALESCE(kd.txn_amount_till_date, 0) AS txn_amount_till_date FROM vishanti_shield_data vsd JOIN magneto_data md ON vsd.user_id = md.user_id LEFT JOIN kuber_data kd ON vsd.user_id = kd.user_id WHERE md.enquiries_amount_till_date > 0 AND md.enquiries_till_date > 0 AND md.order_amount_till_date > 0 AND md.order_till_date > 0 ORDER BY vsd.user_id ASC;"
    all_data = []

    db_config = get_db_config(environment_name)

    # Fetch data from each database
    data = fetch_data_from_db(db_config, query)
    all_data.extend(data)

    filename = 'data_export.xlsx'
    generate_excel(all_data, filename)
    send_email_with_attachment(filename, environment_name)
    print('Email sent successfully with the Excel attachment.')

# Main script

if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_name)
main('prod')
