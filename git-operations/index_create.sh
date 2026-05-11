#!/bin/bash

KIBANA_URL="http://localhost:5601"
TIME_FIELD="@timestamp"
INDEX_PATTERNS=(
  "shield*"
  "zeus*"
  "sanchar*"
  "brahma*"
  "vishanti*"
  "cms*"
)

for INDEX_PATTERN in "${INDEX_PATTERNS[@]}"; do
  echo "Creating Kibana index pattern: $INDEX_PATTERN"

  curl -X POST "$KIBANA_URL/api/saved_objects/index-pattern/$INDEX_PATTERN" \
    -H "kbn-xsrf: true" \
    -H "Content-Type: application/json" \
    -d "{
      \"attributes\": {
        \"title\": \"$INDEX_PATTERN\",
        \"timeFieldName\": \"$TIME_FIELD\"
      }
    }"
  echo ""
done

echo -e "\n✅ Index patterns creation attempted"