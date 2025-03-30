python.exe -m pip install --upgrade pip
py -m venv .venv
source .venv/Scripts/activate
py -m pip install Django
django-admin startproject myproject
cd myproject
py manage.py runserver
deactivate
dos2unix README.md
