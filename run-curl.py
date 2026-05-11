import subprocess
import time

# Define the URL and the number of iterations
url = """"http://localhost:13000/v1/mudra/payment-gateway/transaction/check-bulk-status' \ --header 'X-PAYMENT-MODE: WEBPAGE' \ --header 'X-PAYMENT-CLIENT: JUSPAY' \ --header 'Content-Type: application/json' \ --data '{ "merchantTransactions": ["TXU2024000364"] }"""
iterations = 10
interval = 0  # Time to wait between iterations in seconds

for i in range(iterations):
    # Run the curl command
    result = subprocess.run(['curl', '-s', url], capture_output=True, text=True)
    
    # Print the output and any errors
    print(f'Iteration {i+1}:')
    print('Output:', result.stdout)
    print('Errors:', result.stderr)
    
    # Wait before the next iteration
    time.sleep(interval)
