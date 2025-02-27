# its the main configuration file for django

' ---------------------------- ALLOWED HOST ----------------------------- '
ALLOWED_HOST = ['10.1.0.109']  # add your own ip so page is available
ALLOWED_HOST = ['*']



' ----------------------------- DATABASES ------------------------------- '
# default configuration to sqlite3
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

# ENGINE main alternatives
'ENGINE': 'django.db.backends.postgresql'
'ENGINE': 'django.db.backends.mysql'
'ENGINE': 'django.db.backends.oracle'
  
# other config variables when not using sqlite
'USER'
'PASSWORD'
'HOST'


' -------------------------------- APPS --------------------------------- '
INSTALLED_APPS = [
	'blog.apps.BlogConfig'  # register app in folder blog, file apps.py and name of class: BlogConfig
]


' ---------------------------- STATIC FILES ----------------------------- '
STATIC_URL = '/static/'  # don't touch this (every app has its static files in a folder called static)
STATICFILES_DIRS = [os.path.join(BASE_DIR), 'static']  # add this line to register a folder called 
													   # static in the project app that will be available for all apps
													   # this is how you register bootstrap

' ------------------------------ OTHERS --------------------------------- '
TIME_ZONE = 'America/Havana'

SESSION_COOKIE_AGE = 5*60  # set session expiration to 5 minutes