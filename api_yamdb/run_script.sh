gunicorn --bind 0:8000 api_yamdb.wsgi:aplication
python manage.py migrate
python manage.py collectstatic
