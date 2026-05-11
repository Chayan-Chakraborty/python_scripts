#!/bin/bash

# Define the URL and headers
url="http://localhost:13000/v1/mudra/payment-gateway/transaction/check-bulk-status"
headers=(
    "X-PAYMENT-MODE: WEBPAGE"
    "X-PAYMENT-CLIENT: JUSPAY"
    "Content-Type: application/json"
    "X-USER-ID: 100"  # Add your actual X-USER-ID value here
)
data='{"merchantTransactions": ["TXU2024000364"]}'

iterations=2000
interval=1  # Time to wait between iterations in seconds

for ((i=1; i<=iterations; i++)); do

# Execute the curl command
response=$(curl -L "$url" \
    --header "${headers[0]}" \
    --header "${headers[1]}" \
    --header "${headers[2]}" \
    --header "${headers[3]}" \
    --data "$data" \
    -s -w "%{http_code}" -o /tmp/response_body.txt)

#echo $response
# Extract HTTP status code and response body
http_code=$response
response=$(tail -n 1 /tmp/response_body.txt)  # Use sed to remove the last line

# Print debugging information
# echo "HTTP status code: $http_code"
# echo "Response body: $response"

# Check the HTTP status code
data_count = 0
if [[ "$http_code" =~ ^[0-9]+$ ]]; then
    if [ "$http_code" -eq 200 ]; then
        echo "Request was successful."
    elif [ "$http_code" -eq 504 ]; then
        echo "HTTP status code: $http_code"
        echo "Response body: $response"
        break
    else
        echo "Error: HTTP status code $http_code"
    fi
else
    echo "Error: Invalid HTTP status code received."
fi

sleep $interval
done
