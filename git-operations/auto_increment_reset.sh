#!/bin/bash

# ===== CONFIG =====
SSH_USER="stage-server"
SSH_HOST="1.tcp.in.ngrok.io"
SSH_PORT="20152"
SSH_KEY="/Users/chayanchakraborty/Downloads/shared-key.pem"

DB_USER="admin"
DB_PASS="fMZewU6YGm7mNJycCm1R"
DB_PORT="3307"

# ==================

echo "🔐 Connecting to $SSH_HOST on port $SSH_PORT..."

ssh -i $SSH_KEY -p $SSH_PORT $SSH_USER@$SSH_HOST << 'EOF'

echo "📦 Fetching databases..."

DBS=$(mysql -u'"$DB_USER"' -p'"$DB_PASS"' -P'"$DB_PORT"' -N -e "
SELECT schema_name 
FROM information_schema.schemata 
WHERE schema_name NOT IN ('mysql','information_schema','performance_schema','sys');
")

for DB in $DBS; do
  echo "🗄️ Database: $DB"

  TABLES=$(mysql -u'"$DB_USER"' -p'"$DB_PASS"' -P'"$DB_PORT"' -N -e "
  SELECT table_name 
  FROM information_schema.tables 
  WHERE table_schema='$DB';
  ")

  for TABLE in $TABLES; do
    echo "  ➡️ Table: $TABLE"

    COUNT=$(mysql -u'"$DB_USER"' -p'"$DB_PASS"' -P'"$DB_PORT"' -N -e "
    SELECT COUNT(*) FROM \`$DB\`.\`$TABLE\`;
    ")

    [ -z "$COUNT" ] && COUNT=0
    NEXT=$((COUNT + 1))

    echo "     Count: $COUNT → AUTO_INCREMENT: $NEXT"

    mysql -u'"$DB_USER"' -p'"$DB_PASS"' -P'"$DB_PORT"' -e "
    ALTER TABLE \`$DB\`.\`$TABLE\` AUTO_INCREMENT=$NEXT;
    " 2>/dev/null || echo "     ⚠️ Skipped (no auto_increment column?)"

  done
done

echo "✅ Done updating all databases"

EOF