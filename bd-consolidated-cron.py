"""
New Cron Sheet(BD-CONSOLIDATED-CRON)

BD wise report. The cron will have following fields.
BD Name
BD Phone Number
Number of DP links created
Number of DPs with atleast 1 project photo
Number of unique contractors creating quotations
Number of unique contractors sharing quotations
"""


from datetime import date, datetime, timedelta
import mysql.connector
import pandas
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import logging


db_configs = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'cms',
        'port' : 3306
    },
    'prod':{
        'user': 'solstice_admin',
        'password': 'MrVr3pyh9SsQ32usWtBK',
        'host': 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com',
        'database': 'cms',
        'port' : 3306,
        'autocommit' : False
    },
    'dev':{
        'user': 'admin',
        'password': 'fMZewU6YGm7mNJycCm1R',
        'host': 'localhost',
        'database': 'cms',
        'port' : 3307,
        'autocommit' : False
    },
    'uat':{
        'user': 'super_user',
        'password': 'ChaMiATeseSe',
        'host': 'localhost',
        'database': 'cms',
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
        'subject': f'BD-CONSOLIDATED-CRON-({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    },
    'prod': {
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,  # For TLS
        'username': 'app_store_dev@pidilite.vc',
        'password': 'gpbs zfep pdwk awgv',
        'from_email': 'app_store_dev@pidilite.vc',
        #'to_emails': ['chayan.chakraborty@pidilite.vc', 'chinmay.jaripatke@pidilite.vc', 'ahona@pidilite.vc', 'anil@pidilite.vc', 'deepak.agarwal@pidilite.vc', 'varsha.singh@pidilite.vc'],  # List of recipients`
        'to_emails': ['chayan.chakraborty@pidilite.vc'],  # List of recipients`
        'subject': f'BD-CONSOLIDATED-CRON-({(datetime.now()).strftime("%Y-%m-%d")})',
        'body': 'Please find the attached Excel file with the data.'
    }
}

def get_emial_config(name):
    return email_configs.get(name)

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

    all_data = []

    data_query = "WITH quotation_created AS ( Select Count(Distinct(e.user_id)) AS 'unique_user_creating' , fup.bd_code  from   shield.`fcc_user_profile` fup left join vishanti.estimator e on e.user_id = fup.user_id left jOIN shield.app_user_role_mapping aurm ON e.user_id = aurm.user_id WHERE aurm.role_id = 1 AND e.status = 'DRAFT' and fup.bd_code is not NULL Group by fup.`bd_code` ), quotation_shared AS ( Select Count(Distinct(e.user_id)) AS 'unique_user_sharing' , fup.bd_code  from   shield.`fcc_user_profile` fup left join vishanti.estimator e on e.user_id = fup.user_id left jOIN shield.app_user_role_mapping aurm ON e.user_id = aurm.user_id WHERE aurm.role_id = 1 AND e.status = 'FINALIZED' and fup.bd_code is not NULL Group by fup.`bd_code` ), dp_list AS ( SELECT dp.contractor_uuid, fup.bd_code, COUNT(CASE WHEN dp.profile_id IS NOT NULL THEN 1 END) AS dp_created FROM cms.digital_profiles dp JOIN shield.fcc_user_profile fup ON dp.contractor_uuid = fup.user_id WHERE dp.contractor_uuid IN (SELECT user_id FROM shield.fcc_user_profile WHERE bd_code IS NOT NULL) GROUP BY dp.contractor_uuid, fup.bd_code ), dp_project_photos AS ( SELECT fup.bd_code, COUNT(pmg.project_id) AS total_photos, COUNT(DISTINCT dp.id) AS dp_count FROM shield.fcc_user_profile fup JOIN digital_profiles dp ON dp.contractor_uuid = fup.user_id JOIN projects_digital_profile_links pdpl ON pdpl.digital_profile_id = dp.id JOIN project_media_galleries_project_links pmg ON pdpl.project_id = pmg.project_id WHERE fup.user_id IN (SELECT user_id FROM shield.fcc_user_profile WHERE bd_code IS NOT NULL) GROUP BY fup.bd_code HAVING COUNT(pmg.project_id) > 0 ), contractor_list AS ( SELECT user_id, bd_code, bd_namer, bd_mobile_number FROM shield.fcc_user_profile WHERE bd_code IS NOT NULL ) SELECT cl.bd_namer as 'BD Name', cl.bd_code as 'BD Code', cl.bd_mobile_number as 'BD Number', COALESCE(SUM(dl.dp_created), 0)  as 'DP links created', COALESCE(dpp.dp_count, 0)  as 'DPs with atleast 1 project photo', COALESCE(qc.unique_user_creating, 0) AS 'Unique contractors creating quotations' , COALESCE(qs.unique_user_sharing, 0) AS 'Unique contractors sharing quotations' FROM contractor_list cl LEFT JOIN dp_list dl ON dl.contractor_uuid = cl.user_id Left JOIN quotation_created qc ON qc.bd_code = cl.bd_code left JOIN quotation_shared qs ON qs.bd_code = cl.bd_code LEFT JOIN dp_project_photos dpp ON dpp.bd_code = cl.bd_code GROUP BY cl.bd_namer, cl.bd_code, cl.bd_mobile_number HAVING SUM(dl.dp_created) > 0 OR COALESCE(SUM(qc.unique_user_creating), 0) > 0 OR COALESCE(SUM(qs.unique_user_sharing), 0) > 0;"
    # Fetch data from each database
    data =  fetch_data_from_db(db_config, data_query)
    all_data.extend(data)

    filename = f'BD-CONSOLIDATED-CRON-({(datetime.now()).strftime("%Y-%m-%d")}).xlsx'
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


