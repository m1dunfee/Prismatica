#!/usr/bin/env sh
set -e

# Ensure manage.py is in current directory
if [ ! -f manage.py ]; then
  echo "Error: manage.py not found in \$(pwd)" >&2
  exit 1
fi

# Wait until Postgres is fully ready
echo "⏳ Waiting for Postgres at $DB_HOST:$DB_PORT…"
until pg_isready -h "$DB_HOST" -p "$DB_PORT" > /dev/null 2>&1; do
  sleep 1
done

echo "✅ Postgres is ready—applying migrations and starting server"
python manage.py migrate
python manage.py runserver 0.0.0.0:8000