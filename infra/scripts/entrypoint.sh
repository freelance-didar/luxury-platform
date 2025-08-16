#!/usr/bin/env bash
set -euo pipefail

/app/infra/scripts/wait-for-it.sh "${POSTGRES_HOST}:${POSTGRES_PORT}" --timeout=30 --strict -- echo "PostgreSQL is up"

python manage.py migrate --noinput
python manage.py collectstatic --noinput

exec gunicorn config.wsgi:application \
  --bind 0.0.0.0:8000 \
  --workers 4 \
  --timeout 60
