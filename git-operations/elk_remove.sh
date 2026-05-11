#!/bin/bash

set -e

echo "🛑 Stopping ELK services..."

# Stop all possible services

for svc in elasticsearch elasticsearch-full kibana kibana-full logstash logstash-full logstash-oss; do
brew services stop $svc 2>/dev/null || true
done

echo "💀 Killing running ELK processes..."

# Try graceful termination first
pkill -f "/opt/homebrew/opt/elasticsearch-full/bin/elasticsearch" 2>/dev/null || true
pkill -f "/usr/local/opt/elasticsearch-full/bin/elasticsearch" 2>/dev/null || true
pkill -f "/opt/homebrew/opt/kibana-full/bin/kibana" 2>/dev/null || true
pkill -f "/usr/local/opt/kibana-full/bin/kibana" 2>/dev/null || true
pkill -f "/opt/homebrew/opt/logstash/bin/logstash" 2>/dev/null || true
pkill -f "/usr/local/opt/logstash/bin/logstash" 2>/dev/null || true
pkill -f "org.elasticsearch.bootstrap.Elasticsearch" 2>/dev/null || true
pkill -f "kibana" 2>/dev/null || true
pkill -f "logstash" 2>/dev/null || true

sleep 2

# Force kill anything still alive
PIDS=$(ps aux | grep -E "elasticsearch|kibana|logstash" | grep -v grep | awk '{print $2}' || true)
if [ -n "$PIDS" ]; then
  echo "Force killing leftover PIDs: $PIDS"
  kill -9 $PIDS 2>/dev/null || true
fi

echo "🗑️ Detecting and uninstalling ELK packages..."

# Detect installed ELK-related packages dynamically

ELK_PACKAGES=$(brew list | grep -E "elastic|kibana|logstash" || true)

if [ -z "$ELK_PACKAGES" ]; then
echo "✅ No ELK packages found"
else
for pkg in $ELK_PACKAGES; do
echo "Removing $pkg..."
brew uninstall --force $pkg || true
done
fi

echo "🧼 Removing leftover files..."

# Intel Mac paths

BASE_INTEL="/usr/local"

# Apple Silicon paths

BASE_ARM="/opt/homebrew"

for BASE in $BASE_INTEL $BASE_ARM; do
echo "Cleaning in $BASE..."

rm -rf $BASE/var/lib/elasticsearch || true
rm -rf $BASE/etc/elasticsearch || true
rm -rf $BASE/var/log/elasticsearch || true

rm -rf $BASE/etc/kibana || true
rm -rf $BASE/var/log/kibana || true

rm -rf $BASE/etc/logstash || true
rm -rf $BASE/var/log/logstash || true

# Remove Cellar & opt leftovers

rm -rf $BASE/Cellar/elasticsearch* || true
rm -rf $BASE/Cellar/kibana* || true
rm -rf $BASE/Cellar/logstash* || true

rm -rf $BASE/opt/elasticsearch* || true
rm -rf $BASE/opt/kibana* || true
rm -rf $BASE/opt/logstash* || true
done

echo "🧹 Cleaning up Homebrew..."
brew cleanup || true
brew autoremove || true
brew services cleanup || true

echo "🔍 Verifying removal..."

REMAINING=$(brew list | grep -E "elastic|kibana|logstash" || true)

if [ -z "$REMAINING" ]; then
echo "✅ ELK stack fully removed"
else
echo "⚠️ Still remaining:"
echo "$REMAINING"
fi

echo "🎉 Done!"
