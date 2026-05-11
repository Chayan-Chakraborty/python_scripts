import sys
import requests
import mysql.connector
from datetime import date

update_payment_status_api_path='/v1/kuber/payment-expectation/update/payment-status'
update_order_summary_api_path='/v1/magneto/order/back-fill'
update_enquiry_summary_api_path='/v1/magneto/enquiry/back-fill'
update_shipment_summary_api_path='/v2/api/shipment/back-fill'

def get_user_id_org_id_map(environment):
    if environment == 'prod':
        host = 'solstice-prod-rds.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'zeus'
        username = 'zeus_write_user'
        password = 'SPqkN66dWTkLmyL@pidilite'
    elif environment == 'uat':
        host = 'solstice-stage-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
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
        password = 'Wdvjo@5504'
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
        query = "SELECT owner_user_id , org_id FROM organization_owner;"
        print(query)
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        user_org_map = {row[0]: row[1] for row in rows}
        conn.close()

        # if user_org_map:
        #     print("User-Org Map:")
        #     for user_id, org_id in user_org_map.items():
        #         print(f"User ID: {user_id}, Org ID: {user_org_map[user_id]}")
        # else:
        #     print("Failed to fetch user-org map from the database.")

        return user_org_map
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None  
def get_enquiry_data(environment, user_org_map):
    if environment == 'prod':
        host = 'prod-solstice-db.cluster-cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'magneto_write_user'
        password = 'SF4ecDghJVE1hiV@pidilite'
    elif environment == 'uat':
        host = 'dbpidilitevc.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    elif environment == 'local':
        host = 'localhost'
        database = 'magneto'
        username = 'root'
        password = 'Wdvjo@5504'
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
        query = "SELECT external_id, status, total_amount, max_retail_price, user_id, project_id, created_by, updated_by, created_at, updated_at FROM enquiry;"
        print(query)
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        entity_stack = []
        for row in rows:
            enquiry_data = {
                "entity_external_id": row[0],
                "status": row[1],
                "amount": row[2],
                "mrp": row[3],
                "org_id": user_org_map[row[4]] if row[4] in user_org_map else None,
                "project_id": row[5],
                "created_by": row[6],
                "updated_by": row[7],
                "created_at": row[8],
                "updated_at": row[9],
                "entity_type": "ENQUIRY",
                "payee_type": "CONTRACTOR",
                "payment_status": "PAYMENT_PENDING",
                "service_type": "PROCUREMENT"
            }
            entity_stack.append(enquiry_data)

        conn.close()

        # if entity_stack:
        #     print("entity_stack Map:")
        #     for stack in entity_stack:
        #         print(stack)
        # else:
        #     print("Failed to fetch user-org map from the database.")

        return entity_stack
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None
def get_order_data(environment, user_org_map):
    if environment == 'prod':
        host = 'prod-solstice-db.cluster-cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'magneto_write_user'
        password = 'SF4ecDghJVE1hiV@pidilite'
    elif environment == 'uat':
        host = 'dbpidilitevc.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    elif environment == 'local':
        host = 'localhost'
        database = 'magneto'
        username = 'root'
        password = 'Wdvjo@5504'
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
        query = "SELECT external_id, status, total_amount, max_retail_price, user_id, project_id, created_by, updated_by, created_at, updated_at, service_type FROM orders;"
        print(query)
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        entity_stack = []
        for row in rows:
            enquiry_data = {
                "entity_external_id": row[0],
                "status": row[1],
                "amount": row[2],
                "mrp": row[3],
                "org_id": user_org_map[row[4]] if row[4] in user_org_map else None,
                "project_id": row[5],
                "created_by": row[6],
                "updated_by": row[7],
                "created_at": row[8],
                "updated_at": row[9],
                "entity_type": "ORDER",
                "payee_type": "CONTRACTOR",
                "payment_status": "PAYMENT_PENDING",
                "service_type": row[10]
            }
            entity_stack.append(enquiry_data)

        conn.close()

        # if entity_stack:
        #     print("entity_stack Map:")
        #     for stack in entity_stack:
        #         print(stack)
        # else:
        #     print("Failed to fetch user-org map from the database.")

        return entity_stack
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None
def get_shipment_data(environment, entity_stack):
    if environment == 'prod':
        host = 'prod-solstice-db.cluster-cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'garuda'
        username = 'garuda_write_user'
        password = '4SjpL0Wfw28Xnny@pidilite'
    elif environment == 'uat':
        host = 'dbpidilitevc.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'garuda'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'garuda'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    elif environment == 'local':
        host = 'localhost'
        database = 'garuda'
        username = 'root'
        password = 'Wdvjo@5504'
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
        query = "SELECT external_id, status, total_amount, max_retail_price, project_id, created_by, updated_by, created_at, updated_at, order_external_id FROM shipment;"
        print(query)
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        shipment_stack = []
        for row in rows:
            matching_entity = [entity['org_id'] for entity in entity_stack if 'entity_external_id' in entity and entity['entity_external_id'] == row[9]]
            if matching_entity:
                org_id = matching_entity[0]
            else:
                org_id = None
            enquiry_data = {
                "entity_external_id": row[0],
                "status": row[1],
                "amount": row[2],
                "mrp": row[3],
                "org_id": org_id,
                "project_id": row[4],
                "created_by": row[5],
                "updated_by": row[6],
                "created_at": row[7],
                "updated_at": row[8],
                "parent_external_id": row[9],
                "entity_type": "SHIPMENT",
                "payee_type": "CONTRACTOR",
                "payment_status": "PAYMENT_PENDING",
                "service_type": "PROCUREMENT"
            }
            shipment_stack.append(enquiry_data)

        conn.close()

        # if shipment_stack:
        #     print("shipment_stack Map:")
        #     for stack in shipment_stack:
        #         print(stack)
        # else:
        #     print("Failed to fetch user-org map from the database.")

        return shipment_stack
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None
def get_entity_external_ids_by_entity_type(environment, entity_type):
    if environment == 'prod':
        host = 'prod-solstice-db.cluster-cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'magneto_write_user'
        password = 'SF4ecDghJVE1hiV@pidilite'
    elif environment == 'uat':
        host = 'dbpidilitevc.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    elif environment == 'local':
        host = 'localhost'
        database = 'magneto'
        username = 'root'
        password = 'Wdvjo@5504'
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
        query = "SELECT entity_external_id FROM entity_stack WHERE entity_type = %s AND status NOT IN ('REJECTED', 'CANCELLED');"
        print(query)
        cursor = conn.cursor()
        cursor.execute(query, (entity_type, ))
        rows = cursor.fetchall()
        entity_external_ids = [row[0] for row in rows]
        print(entity_external_ids)
        conn.close()

        return entity_external_ids
    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None
def update_payment_status(entity_external_ids, environment):
    batch_size = 50
    if entity_external_ids:
        for initial_id in range (0, len(entity_external_ids), batch_size):
            final_id = initial_id + batch_size
            print(f"final_id:  {final_id}")
            external_ids = entity_external_ids[initial_id:min(final_id, len(entity_external_ids))]
            print(f"external_ids:  {external_ids}")
            if environment == 'prod':
                api_url = 'http://prod-kuber-elb-1351170978.ap-south-1.elb.amazonaws.com'
            elif environment == 'uat':
                api_url = 'http://uat-magneto-elb-1910436795.ap-south-1.elb.amazonaws.com'
            elif environment == 'dev':
                api_url = 'http://internal-ecs-dev-internal-alb-971782609.ap-south-1.elb.amazonaws.com'
            elif environment == 'local':
                api_url = 'http://localhost:11000'
            else:
                print("Invalid environment provided.")
                return
            print("Before calling requests")
            response_obj = requests.put(
                f'{api_url}{update_payment_status_api_path}',
                json=external_ids
            )
            print("Request is made and ")
            print(response_obj)
            if response_obj.status_code == 200:
                print(f"API call successful for emp_ids: {external_ids}")
            else:
                print(f"API call failed in update_payment_status for emp_ids : {external_ids}")
def update_order_summary(environment, entity_external_ids, order_id_list):
    # entity_external_ids=['OD1669281771379', 'OD20022300003', 'OD20022300005', 'OD20022300008', 'OD20022300009', 'OD27022300001', 
    #                      'OD28022300001', 'OD03032300002', 'OD07032300004', 'OD07032300005']
    batch_size = 1
    if entity_external_ids:
        for initial_id in range (0, len(entity_external_ids), batch_size):
            final_id = initial_id + batch_size
            print(f"final_id:  {final_id}")
            external_ids = entity_external_ids[initial_id:min(final_id, len(entity_external_ids))]
            print(f"external_ids:  {external_ids}")
            if environment == 'prod':
                api_url = 'http://prod-magneto-elb-2019948359.ap-south-1.elb.amazonaws.com'
            elif environment == 'uat':
                api_url = 'http://uat-magneto-elb-1910436795.ap-south-1.elb.amazonaws.com'
            elif environment == 'dev':
                api_url = 'http://internal-ecs-dev-internal-alb-971782609.ap-south-1.elb.amazonaws.com'
            elif environment == 'local':
                api_url = 'http://localhost:21000'
            else:
                print("Invalid environment provided.")
                return
            print("Before calling requests")
            response_obj = requests.post(
                f'{api_url}{update_order_summary_api_path}',
                json = external_ids
            )
            print("Request is made and ")
            print(response_obj)
            if response_obj.status_code == 200:
                print(f"API call successful for external_ids: {external_ids}")
            else:
                print(f"API call failed in Order Update for external_ids: {external_ids}")
                order_id_list.extend(external_ids);
def update_enquiry_summary(environment, entity_external_ids):
    batch_size = 50
    if entity_external_ids:
        for initial_id in range (0, len(entity_external_ids), batch_size):
            final_id = initial_id + batch_size
            print(f"final_id:  {final_id}")
            external_ids = entity_external_ids[initial_id:min(final_id, len(entity_external_ids))]
            print(f"external_ids:  {external_ids}")
            if environment == 'prod':
                api_url = 'http://prod-magneto-elb-2019948359.ap-south-1.elb.amazonaws.com'
            elif environment == 'uat':
                api_url = 'http://uat-magneto-elb-1910436795.ap-south-1.elb.amazonaws.com'
            elif environment == 'dev':
                api_url = 'http://internal-ecs-dev-internal-alb-971782609.ap-south-1.elb.amazonaws.com'
            elif environment == 'local':
                api_url = 'http://localhost:21000'
            else:
                print("Invalid environment provided.")
                return
            print("Before calling requests")
            response_obj = requests.post(
                f'{api_url}{update_enquiry_summary_api_path}',
                json=external_ids
            )
            print("Request is made and ")
            print(response_obj)
            if response_obj.status_code == 200:
                print(f"API call successful for external_ids: {external_ids}")
            else:
                print(f"API call failed in Enquiry Update for external_ids: {external_ids}")
def update_shipment_summary(environment, entity_external_ids):
    batch_size = 50
    entity_external_ids = list(set(entity_external_ids))
    if entity_external_ids:
        for initial_id in range (0, len(entity_external_ids), batch_size):
            final_id = initial_id + batch_size
            print(f"final_id:  {final_id}")
            external_ids = entity_external_ids[initial_id:min(final_id, len(entity_external_ids))]
            print(f"external_ids:  {external_ids}")
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
                f'{api_url}{update_shipment_summary_api_path}',
                json=external_ids
            )
            print("Request is made and ")
            print(response_obj)
            if response_obj.status_code == 200:
                print(f"API call successful for external_ids: {external_ids}")
            else:
                print(f"API call failed in shipment update for external_ids: {external_ids}")

def check_float_value(value):
    if value is None:
        value = 0
    else:
        value = float(value)
    return value
def check_int_value(value):
    if value is None:
        value = 0
    else:
        value = int(value)
    return value
def check_str(value):
    if value is None:
        value = ''
    else:
        value = str(value)
    return value

def insert_in_entity_stack(environment, entity_stack):
    if environment == 'prod':
        host = 'prod-solstice-db.cluster-cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'magneto_write_user'
        password = 'SF4ecDghJVE1hiV@pidilite'
    elif environment == 'uat':
        host = 'dbpidilitevc.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'dbpidilitevc'
        password = 'dbpidilitevc'
    elif environment == 'dev':
        host = 'sosltice-dev-db.cjkcxc4q21f9.ap-south-1.rds.amazonaws.com'
        database = 'magneto'
        username = 'admin'
        password = 'fMZewU6YGm7mNJycCm1R'
    elif environment == 'local':
        host = 'localhost'
        database = 'magneto'
        username = 'root'
        password = 'Wdvjo@5504'
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
        values_list = []

        for entity in entity_stack:
            if entity:
                values_list.append((
                    check_str(entity['entity_type']),
                    check_str(entity['entity_external_id']),
                    check_str(entity['status']),
                    check_str(entity['payee_type']),
                    check_float_value(entity['amount']),  
                    check_float_value(entity['mrp']),     
                    check_str(entity['payment_status']),
                    check_int_value(entity['org_id']),    
                    check_int_value(entity['project_id']),
                    check_int_value(entity['created_by']),
                    check_int_value(entity['updated_by']),
                    check_str(entity['created_at']),
                    check_str(entity['updated_at']),
                    check_str(entity['service_type'])
                ))
        query_truncate = "TRUNCATE TABLE entity_stack"
        query = "INSERT INTO entity_stack (entity_type, entity_external_id, status, payee_type, amount, mrp, payment_status, org_id, project_id, created_by, updated_by, created_at, updated_at, service_type) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        cursor = conn.cursor()
        cursor.execute(query_truncate)
        for row_values in values_list:
            cursor.execute(query, row_values)
        conn.commit()
        cursor.close()
        
        conn.close()

    except mysql.connector.Error as e:
        print(f"Error connecting to the database: {e}")
        return None  
def back_filled_entity_stack_data(environment, user_org_map):
    entity_stack= []
    entity_stack.extend(get_enquiry_data(environment, user_org_map))
    entity_stack.extend(get_order_data(environment, user_org_map))
    entity_stack.extend(get_shipment_data(environment, entity_stack))

    entity_stack = sorted(entity_stack, key=lambda x: x['created_at'].strftime('%Y-%m-%d %H:%M:%S') if 'created_at' in x else '')
    insert_in_entity_stack(environment, entity_stack)
    return entity_stack
def update_entity_summary(environment):
    order_external_ids = get_entity_external_ids_by_entity_type(environment, 'ORDER')
    enquiry_external_ids = get_entity_external_ids_by_entity_type(environment, 'ENQUIRY')
    order_id_list=[]
    update_order_summary(environment, order_external_ids, order_id_list)
    print(order_id_list)
    update_enquiry_summary(environment, enquiry_external_ids)
    update_shipment_summary(environment, order_external_ids)

def entity_stack_back_fill(environment_name):
    user_org_map = get_user_id_org_id_map(environment_name)
    entity_stack = back_filled_entity_stack_data(environment_name, user_org_map)
    order_external_ids = get_entity_external_ids_by_entity_type(environment_name, 'ORDER')
    update_payment_status(order_external_ids, environment_name)
    update_entity_summary(environment_name)
                
                
# def lambda_handler(event, context):
#     environment_name = event.get("environment")
#     entity_stack_back_fill(environment_name)

def main(environment_name):
    entity_stack_back_fill(environment_name)

if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_name)
    main('local')