import sys
import requests
import mysql.connector
import datetime
from datetime import date

current_datetime = datetime.datetime.now()
formatted_datetime = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
api_path='/v1/api/cron/attendance/daily-marker'
# Fetch emp ids from databse
def fetch_emp_ids_from_database(environment, attendance_date):
    # Connect to your MySQL database
    if environment == 'prod':
        host = 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'zeus_write_user'
        password = 'aMhP87yngkoxR'
    elif environment == 'stage':
        host = 'solstice-stage-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    else:
        print("Invalid environment provided.")
        return None

    try:
        conn = mysql.connector.connect(
            host=host,
            database=database,
            user=username,
            password=password
        )
        query = "SELECT id FROM employee_profile WHERE status = 'ACTIVE' AND last_active_from <= %s AND id NOT IN (SELECT employee_profile_id FROM employee_account_transaction WHERE end_date >= %s);"
       	print(query)
        cursor = conn.cursor()
        cursor.execute(query, (attendance_date, attendance_date, ))
        rows = cursor.fetchall()
        emp_id_list = [row[0] for row in rows]
        conn.close()
        print(emp_id_list)
        return emp_id_list
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None
# Function to mark daily attendance of active employee
def call_daily_attendance_marker(environment, attendance_date):
    emp_id_list = fetch_emp_ids_from_database(environment, attendance_date)
    batch_size = 20
    if emp_id_list:
        for initial_id in range (0, len(emp_id_list), batch_size):
            final_id = initial_id + batch_size
            print(f"final_id:  {final_id}")
            emp_ids = emp_id_list[initial_id:min(final_id,len(emp_id_list))]
            print(f"emp_ids:  {emp_ids}")
            if environment == 'prod':
                api_url = 'http://prod-shield-elb-897175134.ap-south-1.elb.amazonaws.com'
            elif environment == 'stage':
                api_url = 'http://ecs-stage-public-alb-1701463202.ap-south-1.elb.amazonaws.com:81'
            elif environment == 'dev':
                api_url = 'http://ecs-dev-public-alb-878955395.ap-south-1.elb.amazonaws.com:81'
            else:
                print("Invalid environment provided.")
                return
            print("Before calling requests")
            response_obj = requests.post(
                f'{api_url}{api_path}',
                json=emp_ids,
				headers={'X-ATTENDANCE-DATE': attendance_date,'content-type':'application/json'},
            )
            print("Request is made and ")
            print(response_obj)
            if response_obj.status_code == 200:
                print(f"API call successful for emp_ids: {emp_ids}")
            else:
                print(f"API call failed for emp_ids: {emp_ids}")


def lambda_handler(event, context):
    environment_name = event.get("environment")
    attendance_date = event.get("attendance_date")
    call_daily_attendance_marker(environment_name, attendance_date)

if __name__ == "__main__":
    # Check if environment argument is provided
    if len(sys.argv) < 2:
        print("Please provide an environment argument (prod, uat, dev).")
    else:
        environment_name = sys.argv[1]
        attendance_date = None
        if attendance_date is None:
            attendance_date = str(date.today())
        print(f"[INFO] {formatted_datetime} +++++++++START OF SCRIPT ++++++++++")
        call_daily_attendance_marker(environment_name, attendance_date)
        print(f"[INFO] {formatted_datetime} +++++++++END OF SCRIPT ++++++++++")
