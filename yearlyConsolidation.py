import sys
import requests
import mysql.connector
from datetime import date, timedelta

api_path = '/v1/api/cron/employee/yearly-consolidation'


# Fetch emp ids from database
def fetch_emp_ids_from_database(environment):
    # Connect to your MySQL database
    if environment == 'prod':
        host = 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'zeus_write_user'
        password = 'aMhP87yngkoxR'
    elif environment == 'uat':
        host = 'dbpidilitevc.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    elif environment == 'local':
        host = 'localhost'
        database = 'zeus'
        username = 'root'
        password = 'Eclipse2022'
    else:
        print("Invalid environment provided.")
        return None

    prev_fin_year_end_date = str(get_prev_financial_year_end_date())

    try:
        conn = mysql.connector.connect(
            host=host,
            database=database,
            user=username,
            password=password
        )
        query = "SELECT id FROM employee_profile WHERE status = 'ACTIVE' AND last_active_from <= %s;"
        print(query)
        cursor = conn.cursor()
        cursor.execute(query, (prev_fin_year_end_date,))
        rows = cursor.fetchall()
        emp_id_list = [row[0] for row in rows]
        conn.close()
        return emp_id_list
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None


# Function to carry forward net balance of prev fin year to current fin year of active employees
def call_yearly_consolidation(environment):
    emp_id_list = fetch_emp_ids_from_database(environment)
    batch_size = 20
    if emp_id_list:
        for initial_id in range(0, len(emp_id_list), batch_size):
            final_id = initial_id + batch_size
            print(f"final_id:  {final_id}")
            emp_ids = emp_id_list[initial_id:min(final_id, len(emp_id_list))]
            print(f"emp_ids:  {emp_ids}")
            if environment == 'prod':
                api_url = 'http://prod-shield-elb-897175134.ap-south-1.elb.amazonaws.com'
            elif environment == 'uat':
                api_url = 'http://uat-shield-elb-938368357.ap-south-1.elb.amazonaws.com'
            elif environment == 'dev':
                api_url = 'http://ecs-dev-public-alb-878955395.ap-south-1.elb.amazonaws.com:81'
            elif environment == 'local':
                api_url = 'http://localhost:8000'
            else:
                print("Invalid environment provided.")
                return
            print("Before calling requests")
            response_obj = requests.post(
                f'{api_url}{api_path}',
                json=emp_ids,
                # headers={'X-ATTENDANCE-DATE': attendance_date,'content-type':'application/json'},
            )
            print("Request is made and ")
            print(response_obj)
            if response_obj.status_code == 200:
                print(f"API call successful for emp_ids: {emp_ids}")
            else:
                print(f"API call failed for emp_ids: {emp_ids}")


def get_prev_financial_year_end_date():
    current_date = date.today()
    dates = get_financial_year_end_dates(get_financial_year(current_date))
    return dates[0] - timedelta(days=1)


def get_financial_year_end_dates(fin_year):
    year = int(fin_year[:4])
    dates = [date(year, 4, 1), date(year + 1, 3, 31)]
    return dates


def get_financial_year(date):
    print(date.year)
    if date.month <= 3:
        fin_year = str(date.year - 1) + '-' + str(date.year)[2:]
    else:
        fin_year = str(date.year) + '-' + str(date.year + 1)[2:]
    return fin_year


def lambda_handler(event, context):
    environment_name = event.get("environment")
    # attendance_date = event.get("attendance_date")
    call_yearly_consolidation(environment_name)

if __name__ == "__main__":
    # Check if environment argument is provided
    if len(sys.argv) < 2:
        print("Please provide an environment argument (prod, uat, dev).")
    else:
        environment_name = sys.argv[1]
        call_yearly_consolidation(environment_name)
