import json
from datetime import datetime
from random import choice

# Constants
total_records = 30_00_000  # 30 lakh (3 million)
batch_size = 100_000  # We'll write in batches to avoid memory issues
output_file_path = "activity_trackers_30lac.json"

# Sample templates
template1 = {
    "entityType": "CATALOGUE",
    "activityActionType": "CATALOGUE_ATTRIBUTE_CREATE",
    "dataMap": {
        "ACTION_USER": "Aditya Raj",
        "ACTION_TIMESTAMP": "2025-06-10 03:24:10"
    }
}

template2 = {
    "entityType": "CATALOGUE",
    "activityActionType": "CATALOGUE_ATTRIBUTE_UPDATE",
    "dataMap": {
        "ACTION_USER": "Aditya Raj",
        "ACTION_TIMESTAMP": "2025-06-10 03:24:10",
        "ACTION_FIELD_CHANGED": "DESC"
    }
}

templates = [template1, template2]

# Create the file and write the opening of the JSON array
with open(output_file_path, "w") as f:
    f.write("[\n")

    for i in range(total_records):
        base = choice(templates)
        record = {
            "entityType": base["entityType"],
            "entityExternalId": f"chayan{i+1}",
            "activityActionType": base["activityActionType"],
            "dataMap": base["dataMap"]
        }

        json.dump(record, f)
        if i < total_records - 1:
            f.write(",\n")
        else:
            f.write("\n")

    # Write the closing of the JSON array
    f.write("]")

output_file_path
