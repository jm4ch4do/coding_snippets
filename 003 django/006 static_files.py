' ---------------------------- STATIC FILES ----------------------------- '

# 1. create a folder for static files (css. javascript, img)
# you generally use static files common to all apps that will be register in a project level
mkdir static
cd static
mkdir css

# if you need static files only for one app then:
cd myapp
mkdir static
cd static
mkdir myapp
# put file here

# 2. update the static file in the configuration (setting.py)
#    add this line after STATIC_URL
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]

# 3. Go to your base.html and register static folder at the top
<!doctype html>
{% load static %}

# 4. Add the static file in the base.html file
<!-- Bootstrap CSS -->

# static file registered at project level in the css folder
<link rel="stylesheet" type="text/css" href="{% static 'css/bootstrap.min.css' %}">

# static file registered at app level in the css folder
<link rel="stylesheet" type="text/css" href="{% static 'myapp/css/main.css' %}">

# 5. If yo
