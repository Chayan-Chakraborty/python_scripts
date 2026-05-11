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
        'port' : 3306
    }
    # Add more databases as needed
}

internal_users = "1286,371,538,464,5371,5324,5317,5397,561,5299,420,419,558,5298,1263,1288,421,372,5362,5308,5305,5307,5310,5306,5309,546,5361,3447,405,388,467,1287,2495,5326,483,408,5381,4204,480,5347,5301,5291,5297,5373,5295,5293,5374,5372,5294,5296,5375,5343,5345,5344,5342,5349,5346,5348,5350,5304,5302,3452,406,5382,5357,5369,5406,5388,556,5391,651,5402,5396,5403,5384,5284,660,2564,5401,810,2200,5399,5408,5404,5405,5400,5392,5393,5394,5395,5398,5300,5303,5380,5351,5370,5356,5358,5379,5352,5365,5367,5368,5366,5353,5378,5354,5355,5359,5377,5327,5331,5330,5407,5329,5328,5335,5336,5332,5334,5337,5311,5313,5319,5312,5314,5316,5315,5318,5323,5340,5339,5341,5338,481,366,367,781,5320,5322,5321,4402,5390,5387,5386,5389,5383,5279,5385,1577,513,418,524,536,655,386,701,466,4684,571,1814,474,1289,437,5376,3637,3639,926,364,696,5325,610,759,628,4791,365,5292,409,392,5333,491,3930,374,1578,2848,375,534,1519,368,5363,5364,369,5360,541,1234"

today = datetime.now()
yesterday_date = (today - timedelta(days=1)).strftime('%Y-%m-%d')
# Calculate yesterday's date

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
        'subject': 'DQG Cron',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['anil@pidilite.vc'],  # List of recipients
        'subject': 'DQG Cron',
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
    query = f"select Count(*) as Count, u.username as Contractor_Number, u.name as Contractor_Name , u.id as user_id, p.id as project_id , p.name as project_name , a.city as City, a.state as State, p.`updated_at` as Project_Updated_Date, u.`updated_at` as User_Updated_Date ,e.id as estimator_id, e.type as estimator_type, e.status as estimator_status , au.`updated_at` as Last_login_date from shield.app_user_v2 u left join shield.app_user_login_v2 ul on u.id=ul.user_id left join vishanti.estimator e on e.user_id=u.id left join zeus.project p on p.consumer_id=e.user_id left join zeus.address a on a.project_id = p.id left join app_user_login_v2 au on au.user_id = u.id where ul.role_id = 1 and  e.status IN ('DRAFT' , 'FINALIZED') and e.`project_id`=p.id and e.`created_at` <= '{yesterday_date} 23:59:59' and e.`user_id`  NOT IN ({internal_users}) group by e.user_id, e.project_id, e.`type`, e.`status`;"
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
