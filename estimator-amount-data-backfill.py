import requests

api_urls = {
    'local' : 'http://localhost:8082',
    'dev' : 'http://localhost:8000',
    'uat' : 'http://localhost:8001',
    'prod' : 'http://prod-vishanti-elb-306674393.ap-south-1.elb.amazonaws.com'
}

def amount_data_backfill_estimator(env):
    try:
        if env not in api_urls:
            raise ValueError(f"Environment '{env}' not found in API_URLS")

        amount_backfill_path = '/v1/vishanti/estimator/update-amount'
        # Send POST request with Headers data
        response = requests.post(f'{api_urls[env]}{amount_backfill_path}')
        # response.raise_for_status()  # Raise exception for HTTP errors

    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print(e)
        raise e

    except Exception as e:
        print(e)
        # Handle any other unexpected error
        raise e

def main(environment_name):
    try : 
        amount_data_backfill_estimator(environment_name)
    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        raise e


# Main script
if __name__ == "__main__":
    import argparse

    # parser = argparse.ArgumentParser(description='Process environment name.')
    # parser.add_argument('environment_name', type=str, help='Environment name (e.g., prod, uat, dev)')
    # args = parser.parse_args()

    # main(args.environment_name)
main('local')
