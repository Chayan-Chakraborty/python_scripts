import csv
import logging
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
Discription : Fetching internal users from sheet
"""

# Database configurations
db_configs = {
    'local':{
        'user': 'root',
        'password': 'Chayan@1340',
        'host': 'localhost',
        'database': 'shield',
        'port' : 3306
    }
    # Add more databases as needed
}


def get_db_config(name):
    return db_configs.get(name)

def get_phone_numbers_from_csv(csv_file_path, phone_number_column_index):
    phone_numbers = []

    # Open the CSV file
    with open(csv_file_path, mode='r', newline='') as csvfile:
        # Create a CSV reader object
        reader = csv.reader(csvfile)
        
        # Iterate over each row in the CSV file
        for row in reader:
            if len(row) > phone_number_column_index:
                phone_number = row[phone_number_column_index]
                phone_numbers.append(phone_number)
    
    return phone_numbers

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
    
def get_user_ids(environment_name):
    phone_numbers = get_phone_numbers_from_csv('/Users/chayanchakraborty/Documents/python_env/prod-crons/internal-users.csv', 0)
    query = f"Select id from shield.app_user_v2 where username in {tuple(phone_numbers)}"
    dbconfig = get_db_config(environment_name)
    user_ids = fetch_data_from_db(dbconfig, query)
    user_id_list = [ids['id'] for ids in user_ids]
    return tuple(user_id_list)
def main(environment_name):
    return get_user_ids(environment_name)

main('prod')
