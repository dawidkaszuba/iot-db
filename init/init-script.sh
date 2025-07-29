#!/bin/bash
set -e

if [ -z "$ADMIN_PASSWORD" ]; then
  echo "ERROR: ADMIN_PASSWORD is not set"
  exit 1
fi

if [ -z "$APP_PASSWORD" ]; then
  echo "ERROR: APP_PASSWORD is not set"
  exit 1
fi


psql -U dawid -d postgres -c "SELECT 1 FROM pg_database WHERE datname='iot'" | grep -q 1 || \
psql -U dawid -d postgres -c "CREATE DATABASE iot;"


psql -U dawid -d postgres -c "CREATE USER iot_admin WITH ENCRYPTED PASSWORD '$ADMIN_PASSWORD';"


psql -U dawid -d iot -c "GRANT ALL PRIVILEGES ON DATABASE iot TO iot_admin;"
psql -U dawid -d iot -c "ALTER USER iot_admin WITH SUPERUSER;"


psql -U dawid -d postgres -c "CREATE USER iot_user WITH ENCRYPTED PASSWORD '$APP_PASSWORD';"


psql -U dawid -d iot -c "GRANT CONNECT ON DATABASE iot TO iot_user;"
psql -U dawid -d iot -c "GRANT USAGE ON SCHEMA public TO iot_user;"
psql -U dawid -d iot -c "GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO iot_user;"
psql -U dawid -d iot -c "GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO iot_user;"
