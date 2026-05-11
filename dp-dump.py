import mysql.connector
import pandas as pd
from openpyxl import Workbook
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging
from datetime import date, datetime, timedelta
# import importli
import sys
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

# Database configurations
db_configs = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'cms',
        'port' : 3306
    },
    'prod':{
        'user': 'cron_read_user',
        'password': 'J5drbt7yHT8NAj4',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'cms',
        'port' : 3306
    }
    # Add more databases as needed
}

module_env_path = {
    'local' :  '/Users/amitkumarmahto/Airflow_pipenv/FetchInternalUser.py',
    'prod' :  '/Users/amitkumarmahto/Airflow_pipenv/FetchInternalUser.py'
    # 'local' :  '/home/ec2-user/common/FetchInternalUser.py',
    # 'prod' :  '/home/ec2-user/common/FetchInternalUser.py'
}

# Email configuration
email_configs = {
    'local': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients
        'subject': f'DP-DUMP-({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        'to_emails': ['anil@pidilite.vc', 'chayan.chakraborty@pidilite.vc'],  # List of recipients
        #'to_emails':  ['chayan.chakraborty@pidilite.vc', 'chinmay.jaripatke@pidilite.vc', 'ahona@pidilite.vc', 'anil@pidilite.vc', 'deepak.agarwal@pidilite.vc', 'varsha.singh@pidilite.vc'],
        'subject': f'DP-DUMP-({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    }
}

def get_db_config(name):
    return db_configs.get(name)


def get_internal_users(module_path, filename, environment_name):
    # Load the module
    spec = importlib.util.spec_from_file_location(filename, module_path)
    internal_user_script = importlib.util.module_from_spec(spec)
    sys.modules[filename] = internal_user_script
    spec.loader.exec_module(internal_user_script)
    # Now you can use functions or classes from your_script
    internal_user_script.main(environment_name)
    return internal_user_script.main(environment_name)


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
    filename = "FetchInternalUser"
    internal_users = get_internal_users(module_env_path[environment_name], filename, environment_name)
    query = f"WITH dp_city_state AS ( SELECT dp.id AS 'profile_id', cwl.city AS 'dp_city', cwl.state AS 'dp_state' FROM digital_profiles_components dpc LEFT JOIN digital_profiles dp ON dp.id = dpc.entity_id LEFT JOIN components_work_location_work_locations cwl ON dpc.component_id = cwl.id WHERE dpc.component_type = 'work-location.work-location' ), dp_project_cost AS ( SELECT dp.id AS 'dp_id', cwl.min , cwl.max FROM digital_profiles_components dpc LEFT JOIN digital_profiles dp ON dp.id = dpc.entity_id LEFT JOIN `components_typical_job_cost_range_typical_job_cost_ranges` cwl ON dpc.component_id = cwl.id WHERE dpc.component_type = 'typical-job-cost-range.typical-job-cost-range' ), fcc_user AS ( SELECT fup.bd_namer, fup.bd_mobile_number, u.id AS 'contractor_id', fup.member_since FROM shield.app_user_v2 u LEFT JOIN shield.fcc_user_profile fup ON u.id = fup.user_id ), business_city_state AS ( SELECT u.id AS 'user_id', a.city, a.state FROM shield.app_user_v2 u LEFT JOIN zeus.organization_owner oo ON oo.owner_user_id = u.id LEFT JOIN zeus.address a ON oo.org_id = a.org_id WHERE u.id NOT IN {internal_users} AND a.project_id IS NULL GROUP BY u.id ), project_links AS ( SELECT COUNT(p.project_media_gallery_id) AS link_count, pdpl.digital_profile_id FROM project_media_galleries_project_links p LEFT JOIN projects_digital_profile_links pdpl ON p.project_id = pdpl.project_id GROUP BY pdpl.digital_profile_id ) SELECT DISTINCT au.name AS 'Contractor Name', au.username AS 'Contractor Phone Number', dp.profile_name AS 'Digital Profile Name', CONCAT('https://letsmultiply.co.in/digital-profile/', dp.profile_id) AS 'DP Profile Link', DATE_FORMAT(au.created_at, '%Y-%m-%d') AS 'Multiply Profile Creation Date', DATE_FORMAT(dp.created_at, '%Y-%m-%d') AS 'DP Creation Date', bcs.city AS 'Business City', bcs.state AS 'Business State', dcs.dp_city AS 'DP City', dcs.dp_state AS 'DP State', IF((dpc.max = 0), CONCAT(dpc.min, '+'), CONCAT(dpc.min,'-', dpc.max)) as 'Typical project cost', fu.bd_namer AS 'BD Name', fu.bd_mobile_number AS 'BD Number', DATE_FORMAT(fu.member_since , '%Y-%m-%d') AS 'FCC Member Since', CASE WHEN dp.profile_picture IS NOT NULL THEN 'YES' ELSE 'NO' END AS 'Profile photo added', pl.link_count AS 'No of project photos added', COUNT(dpsl.service_id) AS 'Expertise count', dp.status AS 'Profile status', DATE_FORMAT(dp.updated_at, '%Y-%m-%d') AS 'DP last updated' FROM cms.digital_profiles dp LEFT JOIN shield.app_user_v2 au ON dp.contractor_uuid = au.id LEFT JOIN shield.app_user_v2 createdUserAU ON dp.created_by_user_id = createdUserAU.id LEFT JOIN business_city_state bcs ON dp.contractor_uuid = bcs.user_id LEFT JOIN dp_city_state dcs ON dp.id = dcs.profile_id LEFT JOIN dp_project_cost dpc ON dp.id = dpc.dp_id LEFT JOIN fcc_user fu ON dp.contractor_uuid = fu.contractor_id LEFT JOIN project_links pl ON pl.digital_profile_id = dp.id LEFT JOIN digital_profiles_services_links dpsl ON dpsl.digital_profile_id = dp.id WHERE au.id NOT IN {internal_users} GROUP BY au.name, au.username, dp.profile_name, dp.profile_id, au.created_at, dp.created_at, bcs.city, bcs.state, dcs.dp_city, dcs.dp_state, fu.bd_namer, fu.bd_mobile_number, fu.member_since, dp.profile_picture, pl.link_count"
    all_data = []

    db_config = get_db_config(environment_name)

    # Fetch data from each database
    data = fetch_data_from_db(db_config, query)
    all_data.extend(data)

    filename = "dp-dump"
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
main('local')
