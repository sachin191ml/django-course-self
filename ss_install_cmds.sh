# Tutorial: https://www.youtube.com/watch?v=Rp5vd34d-z4
# Install python with Djano extension
python.exe -m pip install --upgrade pip
py -m venv .venv
source .venv/Scripts/activate
py -m pip install Django

# Start a new django project
django-admin startproject myproject
cd myproject
py manage.py runserver

# Create a new app inside a project
cd myproject
py manage.py startapp posts

# Misc commands
dos2unix README.md

deactivate
