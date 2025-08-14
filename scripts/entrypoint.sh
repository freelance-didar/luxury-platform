#!/bin/sh

./scripts/wait-for-it.sh ${POSTGRES_HOST}:${POSTGRES_PORT} --timeout=30 --strict -- echo "PostgreSQL is up"

python manage.py migrate
python manage.py collectstatic --noinput

gunicorn config.wsgi:application --bind 0.0.0.0:8000 --workers=4
