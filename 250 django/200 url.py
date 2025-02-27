
' ---------------------------- MULTIPLE URLS ----------------------------- '
# urls for each app are written in the app folder 
# by adding a new file named 'urls.py' ex. '/polls/urls.py'
# -FILE: polls/urls.py
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
]

# -FILE: site1/urls.py
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('polls/', include('polls.urls')),  # includes polls/url.py
    path('admin/', admin.site.urls),  # django admin site
]