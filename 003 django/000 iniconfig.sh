#!/usr/bin/env bash
' ------------------------------ BASICS ------------------------------ '
# instruction to export proxy for cmd
https://docs.cloudfoundry.org/cf-cli/http-proxy.html

# instruction to export proxy for cmd
http://garmoncheg.blogspot.com/2012/01/establishing-dev-environment-with.html
# and then you need to add your project to the windows path



# run all this codes in cmd
python --version # verifying which python version is installed
python -V # is the same
pip -V

pip install virtualenv
#navigate to the installation folder using cd
virtualenv . # install virtual environment in the current folder (. means current folder)

.\Scripts\activate # for windows
source bin/activate # for linux

pip install django # use pip install django==2.0.7 if you want any specific version
python -m django --version  # see django version

pip freeze # shows installed packages
pip list # same for better format

deactivate # both for windows and linux once inside the environment


' ------------------------------ DJANGO ------------------------------ '
cd D:\dev\001env\
# run this in the command line
django-admin startproject site1 # create python project
cd site1
python manage.py runserver # run django server
http://localhost:8000/  # check site on browser

# MIGRATIONS
python manage.py makemigrations # looks at models in database from classes in code
python manage.py migrate # looks at models and creates tables in database

python manage.py createsuperuser # create superuser for admin

# APPS
python manage.py startapp first_app 


' ------------------------- REPETITIVE STEPS ------------------------- '
D:\dev\trydjango\Scripts\activate
python D:\dev\trydjango\first_project\manage.py runserver



# open python shell with a django project included
python manage.py shell

# handle products in command line
from products.model import Product
Product.objects.all() # show all
Product.objects.create(title='New product 2', description='another one', price='19312', summary='sweet')