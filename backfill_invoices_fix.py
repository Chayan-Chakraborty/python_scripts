import mysql.connector
import logging

import requests

api_hosts = {
    'local' : 'http://localhost:8000',
    'dev' : 'http://ecs-dev-public-alb-878955395.ap-south-1.elb.amazonaws.com:81',
    'uat' : 'http://localhost:8001',
    'prod' : 'http://prod-public.letsmultiply.app:81'
}

batch_size = 500

internal_user = {
    'local' : 338,
    'dev' : 338,
    'uat' : 386,
    'prod' : 402
}

queries = {
    'fetch_users' : 'SELECT u.username FROM app_user_v2 u JOIN app_user_role_mapping au on au.user_id= u.id and au.role_id=1 and au.active=1 LEFT JOIN fcc_user_profile fup ON u.id = fup.user_id WHERE fup.user_id IS NULL;'
}


def build_api_url(environment_name, api_path):
    return f'{api_hosts[environment_name]}{api_path}'


def fill_fcc_data(environment_name):
    
    api_headers = {
    'Content-Type': 'application/json',
    'Authorization': f'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4MTIzOTY4NTUxIiwiY3JlZGVudGlhbHMiOiJPVFF4Tnc9PSIsImNoYW5uZWwiOiJBRE1JTl9XRUIiLCJ1c2VyUm9sZSI6IkFETUlOIiwiZXhwIjoxNzU2NDA1ODAwLCJ1c2VySWQiOjQ4MywiYXBwVXNlckxvZ2luSWQiOjM0Nzl9.pxHUMmIFXuspZJ18v_U63pG_Zl7RhbL62i8IU27k2U4',
    'X-USER-ROLE': 'ADMIN',
    'X-CHANNEL': 'ADMIN_WEB',
    'X-USER-ROLE': 'ADMIN',
    'X-USER-NAME': '8123968551',
    'X-SERVICE-TYPE' : 'PROCUREMENT',
    'X-LOGIN-ROLE' : 'ADMIN',
    'X-USER-ID' : '1287',
    'X-ORG-ID' : '85' 
    } 
    
    try:

        order_ids = [
    "OD20052500006",
    "OD21052500001",
    "OD22052500002",
    "OD22052500001",
    "OD24052500001",
    "OD27052500001",
    "OD27052500002",
    "OD27052500003",
    "OD27052500004",
    "OD27052500005",
    "OD27052500006",
    "OD27052500007",
    "OD27052500008",
    "OD27052500009",
    "OD27052500010",
    "OD27052500011",
    "OD27052500012",
    "OD27052500013",
    "OD27052500014",
    "OD27052500015",
    "OD27052500016",
    "OD27052500017",
    "OD28052500001",
    "OD28052500002",
    "OD28052500003",
    "OD28052500004",
    "OD28052500005",
    "OD28052500006",
    "OD28052500007",
    "OD28052500008",
    "OD28052500009",
    "OD28052500010",
    "OD29052500002"
]
 

        for order_id in order_ids:
            api_path = f"/v2/api/shipment/{order_id}/invoice"
            api_url = build_api_url(environment_name, api_path)
            print(api_url)
            response = requests.post(api_url, headers=api_headers)
            response.raise_for_status()
        
         # Raise an HTTPError for bad responses
       
    except requests.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    except ConnectionError as conn_err:
        print(f"Connection error occurred: {conn_err}")
    except requests.RequestException as req_err:
        print(f"An error occurred: {req_err}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


def main(environment_name):
    fill_fcc_data(environment_name)
# Main script

if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment_nameironment name.')
    # parser.add_argument('environment_nameironment_name', type=str, help='environment_nameironment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_nameironment_name)
main('prod')
