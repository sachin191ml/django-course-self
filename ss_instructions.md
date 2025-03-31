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
deactivate
dos2unix README.md

# Lesson-03 commands
py manage.py migrate
py manage.py makemigrations

# Lesson-04 commands
py manage.py shell
Python 3.11.7 (tags/v3.11.7:fa7a6f2, Dec  4 2023, 19:24:49) [MSC v.1937 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from posts.models import Post
>>> p = Post()
>>> p
<Post: Post object (None)>
>>> p.title = "my First Post!"
>>> p.save()
>>> Post.objects.all()
<QuerySet [<Post: Post object (1)>]>
>>> exit()
(.venv)
sachi_000@SAC_IVB_DT MINGW64 /h/Sachin_2/Engineering/Projects/MyWebsite/Django/django-course-self/myproject (master *)
$ py manage.py shell
Python 3.11.7 (tags/v3.11.7:fa7a6f2, Dec  4 2023, 19:24:49) [MSC v.1937 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from posts.models import Post
>>> p = Post()
>>> p.title = "My 2nd Post"
>>> p.save()
>>> Post.objects.all()
<QuerySet [<Post: my First Post!>, <Post: My 2nd Post>]>
>>> exit()

#  Lesson-05 commands
py manage.py runserver 8001
py manage.py createsuperuser
Username (leave blank to use 'sachi_000'): sac
Email address:
Password: sacdjango
Password (again):
Superuser created successfully.
(.venv)

#  Lesson-07 commands
py manage.py makemigrations
py manage.py migrate

# Lesson-08 Steps to add a new app (Add User App) - creating a new web page template
# Will creiate a new web page
1. Create a new App using following command:
   py manage.py startapp users
   ('users' directory will be created)
2. Tell master app about the new app
   myproject/settings.py: Add 'users' in  INSTALLED_APPS (put comma at the end as well)
3. Do following changes in the new app directory
   users/urls.py: Create urls.py file  and add app name and list of urlpatterns to add - path, view and name
4. In the main app add the new  app urls to the urlpatterns
   myproject/urls.py: add path to include the new urls paths (make sure paths are comma seaparated)
5. Create views for the new app (specify which html file to show and data to show on the page, passed as paramaters optionally)
   users/views.py
6. Create templates for new app
   users/templates/users/register.html (with a varible if data is being passed)
7. Adjust css style file if needed
   static/css/style.css
