import requests
import json
import time

# Configurable values
url = "http://127.0.0.1:8084/suchi/v1/activity-tracker/save/all"  # Replace with actual URL
json_file_path = "/Users/chayanchakraborty/Documents/python_new_dir/activity_trackers_30lac.json"              # Path to your JSON file
chunk_size = 10000                                            # Number of records per chunk

headers = {
    "Content-Type": "application/json"
    # Add "Authorization": "Bearer <token>" if needed
}

# Load and yield chunks from the file
def load_json_chunks(file_path, chunk_size):
    with open(file_path, "r") as f:
        full_data = json.load(f)
        for i in range(0, len(full_data), chunk_size):
            yield full_data[i:i + chunk_size], i // chunk_size + 1

# Send each chunk and log latency
for chunk, index in load_json_chunks(json_file_path, chunk_size):
    start_time = time.time()
    response = requests.post(url, headers=headers, json=chunk)
    latency = time.time() - start_time

    print(f"[Batch {index}] Status: {response.status_code}, Latency: {latency:.2f}s")

    if response.status_code != 201 and response.status_code != 200:
        print("❌ Error Response:", response.text)
        break
