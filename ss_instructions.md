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

### Lesson 10: Adding a Login Page  
1. **Create a Login Page**  
   - **templates/layout.html**: Add a navigation button for "Login."  
   - **users/urls.py**: Update urlpatterns to include the login page and corresponding view.  
   - **users/views.py**: Implement a view function to render the login page.  
   - **users/templates/users/login.html**: Create an HTML template for the login page.  
   - **users/views.py**: Update view logic for handling user login.  
   - **static/css/style.css**: Make styling adjustments if needed.  

2. **Implement User Authentication on Login**  
   - Modify **users/views.py** to retrieve the username and authenticate the user.  

---

### Lesson 11: Authentication – Restricting Access to Valid Pages  
1. Create a Logout Button  
2. **Add a Page in the Posts App for Creating New Posts**  
   - This page should be restricted to logged-in users only.  
   - **posts/urls.py**: Add a route for the new post creation page.  
   - **posts/views.py**: Implement the logic to handle the new post creation.  
   - **posts/templates/posts/post_new.html**: Create an HTML template for this page.  
   - **templates/layout.html**: Add a navigation button labeled "New Post."  

3. **Restrict Access to the "New Post" Page**  
   - **posts/views.py**: Apply the `login_required` decorator to restrict access.  
   - **users/views.py**: Update the logic to ensure redirection based on user authentication.  
   - **templates/layout.html**: Modify the navigation bar to conditionally display buttons based on authentication status.  

---

### Lesson 12: Adding a Custom Form  
1. **Create a Data Entry Form**  
   - **posts/forms.py**: Define a form and specify which fields should be selected from the database model.  
   - **posts/views.py**: Pass the form with model fields to the HTML template.  
   - **posts/templates/posts/post_new.html**: Display the form and bind database fields to values.  
   - Update **static/css/style.css** if necessary for styling adjustments.  

2. **Validate the Form Data**  
   - **posts/views.py**: Implement validation logic to ensure correct data entry.  

3. **Link User Information to Posts (Relational Database)**  
   - Since this involves modifying the database schema, run migration commands.  
   - If needed, clear the database or add missing data.  

4. **Save User Information to the Database**  
   - **posts/views.py**: Implement logic to save form data, ensuring user information is stored correctly.  

---
## Additional Resources
- [Custom Forms in Django](https://docs.djangoproject.com/en/5.1/topics/forms/)
- [Django Forms Guide (GeeksforGeeks)](https://www.geeksforgeeks.org/django-forms/)
