#!/bin/bash

if [ -e /database/secret.key ]
then
  echo 'Secret Key found.'
  
else
  echo 'Creating new Secret Key.'
  python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())' > /database/secret.key
fi

if [ -e /database/db.sqlite3 ]
then
  echo 'Existing Database found, trying migrations.'
  python manage.py makemigrations
  python manage.py migrate
else
  echo 'Creating new Admin user in new Database.'
  python manage.py makemigrations
  python manage.py migrate
  export DJANGO_SUPERUSER_PASSWORD="admin"
  python manage.py createsuperuser --username admin --email admin@example.com --noinput
  unset DJANGO_SUPERUSER_PASSWORD
fi

service nginx start
gunicorn smarthome.wsgi:application