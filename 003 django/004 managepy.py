' ---------------------------- RUNSERVER ----------------------------- '
python manage.py runserver # run django server on localhost (only visible to localhost)
python manage.py runserver 8080  # change the port
http://localhost:8000/  # check site on browser
    
python manage.py runserver 8080 # to choose a different port
python manage.py runserver 10.1.0.109:8000 # run on my ip so everyone can see

# check everything is ok before running
python manage.py check

# allow hosts to djangopytho

FOLDER/settings.py
ALLOWED_HOST = ['10.1.0.109']  # for me to access
ALLOWED_HOST = ['*']  # for everyone to access 

' ------------------------------- APPS ------------------------------- '
# create app
python manage.py startapp my_app

# register app at project level
/project_folder/settings.py/
	INSTALLED_APPS = [
		'my_app.apps.My_appConfig'  # copy the class name from /my_app/apps.py
	]



' --------------------------- MIGRATIONS ----------------------------- '
python manage.py makemigrations  # prepares migrations to be executed on the database
								 # creates a file in /myapp/migrations (example: blog/migrations/0001_initial.py)
python manage.py sqlmigrate blog 0001  # see sql code that the migration is going to execute


python manage.py migrate # executes migrations previously prepared


' ----------------------------- ADMIN APP ---------------------------- '
python manage.py createsuperuser # create superuser for admin

# register model in admin app (go to /myapp/admin.py)
from .models import Post
admin.site.register(Post)  # this makes Post data available in the admin web interface

