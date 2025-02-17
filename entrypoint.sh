#!/bin/sh

# Set permissions for all required directories
chown -R clickhouse:clickhouse /var/lib/clickhouse
chown -R clickhouse:clickhouse /var/log/clickhouse-server
chown -R clickhouse:clickhouse /etc/clickhouse-server

# Only process users.xml template since config.xml is now static
envsubst < /etc/clickhouse-server/users.xml.template > /etc/clickhouse-server/users.xml

# Start ClickHouse server
exec /entrypoint.sh

