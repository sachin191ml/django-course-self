## Tutorial: [YouTube Link](https://www.youtube.com/watch?v=Rp5vd34d-z4)

### Installing Python with Django Extension
```sh
python.exe -m pip install --upgrade pip
py -m venv .venv
source .venv/Scripts/activate
py -m pip install Django
```

### Starting a New Django Project
```sh
django-admin startproject myproject
cd myproject
py manage.py runserver
```

### Creating a New App Inside the Project
```sh
cd myproject
py manage.py startapp posts
```

### Miscellaneous Commands
```sh
deactivate
dos2unix README.md
```

## Lesson Notes

### Lesson 03: Database Migrations
```sh
py manage.py migrate
py manage.py makemigrations
```

### Lesson 04: Using Django Shell
#### First Session
```sh
py manage.py shell
```
```python
Python 3.11.7 (tags/v3.11.7:fa7a6f2, Dec 4 2023, 19:24:49) [MSC v.1937 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from posts.models import Post
>>> p = Post()
>>> p.title = "My First Post!"
>>> p.save()
>>> Post.objects.all()
<QuerySet [<Post: Post object (1)>]>
>>> exit()
```

#### Second Session
```sh
py manage.py shell
```
```python
Python 3.11.7 (tags/v3.11.7:fa7a6f2, Dec 4 2023, 19:24:49) [MSC v.1937 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from posts.models import Post
>>> p = Post()
>>> p.title = "My Second Post"
>>> p.save()
>>> Post.objects.all()
<QuerySet [<Post: My First Post!>, <Post: My Second Post>]>
>>> exit()
```

### Lesson 05: Creating a Superuser
```sh
py manage.py runserver 8001
py manage.py createsuperuser
```
#### Sample Superuser Creation Process:
```
Username (leave blank to use 'user_default'): sac
Email address:
Password: sacdjango
Password (again):
Superuser created successfully.
```

### Lesson 07: Running Migrations
```sh
py manage.py makemigrations
py manage.py migrate
```

### Lesson 08: Adding a New App (User App & Web Page Template)
1. Create a new app:
   ```sh
   py manage.py startapp users
   ```
   This creates a `users` directory.
2. Register the new app:
   - Modify `myproject/settings.py`: Add `'users'` to `INSTALLED_APPS` (ensure there's a comma at the end).
3. Configure URLs:
   - Create `users/urls.py` and define `app_name` and `urlpatterns`.
   - Update `myproject/urls.py` to include the new app's URLs.
4. Define Views:
   - Modify `users/views.py` to specify which HTML file to display and pass optional data.
5. Create Templates:
   - Add `users/templates/users/register.html` (with variables for passed data).
6. Adjust CSS styles (if needed):
   - Modify `static/css/style.css`.

### Lesson 09: Implementing User Registrationa Page
1. Create a form in `users/views.py` and pass it to the HTML template.
2. Update the template (`users/templates/users/register.html`):
   - Define form submission behavior and validation.
   - Add a CSRF token to prevent Django authentication errors.
   - Include form input fields and a submit button.
3. Update CSS (`myproject/static/css/style.css`) for validation and styling.
4. Save user information upon form submission:
   - Modify `users/views.py` to validate input and redirect appropriately.
5. Add a navigation button to access the user registration page:
   - Update `myproject/templates/layout.html` to include a button with a hover title.

### Lesson 10: User Login Page and Authentication
1. Update user app to add Login page as follows:
   a. templates/layout.html: Add nav 'Login' button
   b. users/urls.py: Update urlpatterns of the user app to have 'Login' page and a view
   c. users/views.py: Add view code to render 'Login' page
   d. users/template/users/login.html:  Create a html 'Login' page
   e. users/views.py: Update view logic
   f. static/css/style.css: make tweaks if needed
2.Add logic to login user after authenticated
   - Modify 'users/views.py' view code to get user name and do login

### Lesson 11: Authetication - allow users to access only valid pages
1. Need to create a Logout button
2. Add page in Post App for user to add a new post
   (this page we would like to protect only for logged-in users)
   a. posts/urls.py: Add a page to add new post by a user
   b. posts/views.py: Create a view proedure and logic for the created page
   c. posts/template/posts/post_new.html:  Create html template for the page
   d. templates/layout.html: Add nav 'New Post' button
3. Protect "New Post' page for autheticated users
   a. posts/views.py: Added login_required decorator
   b. users/views.py & users/views.py: Get value to go the right page based on user authentication
   c. TBD next - Add conditional checks to nav bar to show right buttons

## Additional Resources
- [Custom Forms in Django](https://docs.djangoproject.com/en/5.1/topics/forms/)
- [Django Forms Guide (GeeksforGeeks)](https://www.geeksforgeeks.org/django-forms/)
