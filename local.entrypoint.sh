#!/bin/sh

set -e

echo "Installing bundler..."
gem install bundler
echo "Verifying and installing gems..."
bundle check || bundle install

# Remove puma.pid so that a docker restart doesn't prevent puma from starting
rm -f /var/run/puma.pid

# Configure DATABASE_URL if POSTGRES_URL is set
if [ -n "${POSTGRES_URL}" ]; then
  echo "Setting DB_ADAPTER=postgresql"
  export DB_ADAPTER=postgresql
  echo "Configuring DATABASE_URL using POSTGRES_URL"
  export DATABASE_URL="${POSTGRES_URL}"
fi

# Configure DATABASE_URL if MYSQL_URL is set
if [ -n "${MYSQL_URL}" ]; then
  echo "Setting DB_ADAPTER=mysql2"
  export DB_ADAPTER=mysql2
  echo "Configuring DATABASE_URL using MYSQL_URL"
  export DATABASE_URL="${MYSQL_URL}"
fi

exec "$@"
