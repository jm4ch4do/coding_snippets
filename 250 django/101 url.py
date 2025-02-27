
' ---------------------------- MULTIPLE URLS ----------------------------- '
# urls for each app are written in the app folder 
# by adding a new file named 'urls.py' ex. '/polls/urls.py'

# -FILE: myapp/urls.py
from django.urls import path

# import views from current folder(current app)
from . import views

# show at path '/', the value returned by the function index in the file  myapp/views.py 
urlpatterns = [
    path('', views.index, name='index'),  # name attribute allows calling this url from templates
]

# -FILE: project_django/urls.py
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('myapp/', include('myapp.urls')),  # remove 'myapp' from the url request and pass the rest to file /myapp/urls.py
    path('admin/', admin.site.urls),  # default django admin site
    
    # url treated as a variable which is latter passed to the view (question_id is the var)
    path('<int:question_id>', views.detail, name='detail'),
    path('<int:question_id>/results', views.detail, name='detail'),
    
]