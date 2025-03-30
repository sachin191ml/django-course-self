python.exe -m pip install --upgrade pip
py -m venv .venv
py -m pip install Django
django-admin startproject myproject
cd myproject
py manage.py runserver
