#!/bin/bash

set -e

echo "🚀 Starting ELK Stack Setup..."

LOG_DIR="/opt/homebrew/etc/logstash"
LOGSTASH_CONFIG_PATH="/opt/homebrew/etc/logstash/logstash.conf"
LOGSTASH_PIPELINE_YML="/opt/homebrew/etc/logstash/pipeline.yml"
KIBANA_URL="http://localhost:5601"
ES_URL="http://localhost:9200"
ES_BIN="/opt/homebrew/opt/elasticsearch-full/bin/elasticsearch"
KIBANA_BIN="/opt/homebrew/opt/kibana-full/bin/kibana"
LOGSTASH_BIN="/opt/homebrew/opt/logstash/bin/logstash"

wait_for_elasticsearch() {
  echo "⏳ Waiting for Elasticsearch to be ready..."
  for i in {1..40}; do
    if curl -fsS "$ES_URL" >/dev/null 2>&1; then
      echo "✅ Elasticsearch is ready"
      return 0
    fi
    sleep 3
  done
  echo "❌ Elasticsearch not ready after waiting"
  echo "📄 Last Elasticsearch logs:"
  tail -n 80 "$LOG_DIR/elasticsearch.log" || true
  return 1
}

wait_for_kibana() {
  echo "⏳ Waiting for Kibana to be ready..."
  for i in {1..60}; do
    status_payload="$(curl -s "$KIBANA_URL/api/status" || true)"
    root_code="$(curl -s -o /dev/null -w "%{http_code}" "$KIBANA_URL" || true)"
    if echo "$status_payload" | grep -q '"overall":{"level":"available"'; then
      echo "✅ Kibana is ready"
      return 0
    fi
    if [[ "$root_code" == "200" || "$root_code" == "302" ]]; then
      echo "✅ Kibana is ready"
      return 0
    fi
    sleep 3
  done
  echo "❌ Kibana not ready after waiting"
  echo "📄 Last Kibana logs:"
  tail -n 80 "$LOG_DIR/kibana.log" || true
  return 1
}

if ! mkdir -p "$LOG_DIR" 2>/dev/null; then
    sudo mkdir -p "$LOG_DIR"
    sudo chown -R "$(id -un)":"$(id -gn)" "$LOG_DIR"
fi

########################################
# INSTALLATION
########################################
echo "🍺 Using Homebrew on macOS"

if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not installed. Install from https://brew.sh"
    exit 1
fi

brew tap elastic/tap
brew install elastic/tap/elasticsearch-full

if ! command -v kibana >/dev/null 2>&1; then
    brew install elastic/tap/kibana-full
else
    echo "✅ kibana already installed"
fi

if ! command -v logstash >/dev/null 2>&1; then
    brew install logstash
else
    echo "✅ logstash already installed"
fi

if [[ -z "${JAVA_HOME:-}" ]]; then
    echo "⚠️ JAVA_HOME is not set. Detecting Java..."
    JAVA_HOME="$(/usr/libexec/java_home -v 17 2>/dev/null || /usr/libexec/java_home 2>/dev/null || true)"
    if [[ -n "$JAVA_HOME" ]]; then
        export JAVA_HOME
    fi
fi

echo "☕ JAVA_HOME=${JAVA_HOME:-not set}"
if [[ -n "${JAVA_HOME:-}" ]]; then
    export PATH="$JAVA_HOME/bin:$PATH"
fi

ES_CONFIG="/opt/homebrew/etc/elasticsearch/elasticsearch.yml"
KIBANA_CONFIG="/opt/homebrew/etc/kibana/kibana.yml"
if grep -q "^xpack.ml.enabled:" "$ES_CONFIG" 2>/dev/null; then
    sed -i.bak 's/^xpack\.ml\.enabled:.*/xpack.ml.enabled: false/' "$ES_CONFIG"
else
    echo "xpack.ml.enabled: false" >> "$ES_CONFIG"
fi

if grep -q "^discovery.type:" "$ES_CONFIG" 2>/dev/null; then
    sed -i.bak 's/^discovery\.type:.*/discovery.type: single-node/' "$ES_CONFIG"
else
    echo "discovery.type: single-node" >> "$ES_CONFIG"
fi

########################################
# CONFIGURATION
########################################

echo "⚙️ Configuring Elasticsearch..."
sed -i.bak 's/#http.port:.*/http.port: 9200/' "$ES_CONFIG" || true

########################################
# LOGSTASH CONFIG
########################################

echo "📝 Creating Logstash config at $LOGSTASH_CONFIG_PATH"

cat <<'EOF' > "$LOGSTASH_CONFIG_PATH"
input {
  file {
    path => [
      "/var/logs/*/*.log"
    ]
    start_position => "beginning"
    sincedb_path => "/dev/null"
  }
}

filter {
  mutate {
    rename => { "host" => "docker.host" }
  }

  if [log][file][path] =~ "shield" {
    mutate { add_field => { "event.dataset" => "shield" } }
  } else if [log][file][path] =~ "magneto" {
    mutate { add_field => { "event.dataset" => "magneto" } }
  } else if [log][file][path] =~ "schedly" {
    mutate { add_field => { "event.dataset" => "schedly" } }
  } else if [log][file][path] =~ "brahma" {
    mutate { add_field => { "event.dataset" => "brahma" } }
  } else if [log][file][path] =~ "kuber" {
    mutate { add_field => { "event.dataset" => "kuber" } }
  } else if [log][file][path] =~ "mudra" {
    mutate { add_field => { "event.dataset" => "mudra" } }
  } else if [log][file][path] =~ "sanchar" {
    mutate { add_field => { "event.dataset" => "sanchar" } }
  } else if [log][file][path] =~ "garuda" {
    mutate { add_field => { "event.dataset" => "garuda" } }
  } else if [log][file][path] =~ "vishanti" {
    mutate { add_field => { "event.dataset" => "vishanti" } }
  } else if [log][file][path] =~ "zeus" {
    mutate { add_field => { "event.dataset" => "zeus" } }
  } else if [log][file][path] =~ "indra" {
    mutate { add_field => { "event.dataset" => "indra" } }
  } else if [log][file][path] =~ "cms" {
    mutate { add_field => { "event.dataset" => "cms" } }
  }

  if [message] =~ "INFO" {
    mutate { add_field => { "log.level.color" => "green" } }
  } else if [message] =~ "WARN" {
    mutate { add_field => { "log.level.color" => "yellow" } }
  } else if [message] =~ "ERROR" {
    mutate { add_field => { "log.level.color" => "red" } }
  } else if [message] =~ "DEBUG" {
    mutate { add_field => { "log.level.color" => "blue" } }
  } else {
    mutate { add_field => { "log.level.color" => "gray" } }
  }

  if [message] =~ "\tat" {
    grok {
      match => ["message", "^(\tat)"]
      add_tag => ["stacktrace"]
    }
  }
}

output {
  if [event.dataset] {
    elasticsearch {
      hosts => ["http://localhost:9200"]
      index => "%{[event.dataset]}_index"
    }
  } else {
    elasticsearch {
      hosts => ["http://localhost:9200"]
      index => "default_index"
    }
  }

  stdout {
    codec => rubydebug
  }
}
EOF

echo "📝 Creating Logstash pipeline config at $LOGSTASH_PIPELINE_YML"
cat <<'EOF' > "$LOGSTASH_PIPELINE_YML"
pipeline.id: logstash-pipeline-id
path.config: "/opt/homebrew/etc/logstash/logstash.conf"
pipeline.batch.size: 125
pipeline.batch.delay: 1
pipeline.workers: 1
EOF

########################################
# START SERVICES
########################################

echo "🚀 Starting Elasticsearch..."
nohup elasticsearch > "$LOG_DIR/elasticsearch.log" 2>&1 &

echo "🔎 Checking Elasticsearch..."
wait_for_elasticsearch

echo "🚀 Starting Logstash..."
nohup logstash -f "$LOGSTASH_CONFIG_PATH" > "$LOG_DIR/logstash.log" 2>&1 &

sleep 8

echo "🔎 Checking Logstash..."
if pgrep -fl "logstash.*$LOGSTASH_CONFIG_PATH" >/dev/null 2>&1; then
    echo "✅ Logstash is running"
else
    echo "❌ Logstash failed to start. Last logs:"
    tail -n 80 "$LOG_DIR/logstash.log" || true
fi

echo "🚀 Starting Kibana..."
nohup kibana > "$LOG_DIR/kibana.log" 2>&1 &

sleep 10

echo "🔎 Checking Kibana..."
curl "$KIBANA_URL" || true

wait_for_kibana || true

########################################
# STATUS
########################################

echo "✅ ELK Stack Started!"
echo ""
echo "🔗 Elasticsearch: http://localhost:9200"
echo ""
echo "📂 Logs:"
echo "  - $LOG_DIR/elasticsearch.log"
echo "  - $LOG_DIR/kibana.log"
echo "  - $LOG_DIR/logstash.log"

########################################
# Creating kibana index patterns
########################################

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