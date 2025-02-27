' ------------------------------ INSTALL ----------------------------- '
pip freeze > requirements.txt

mkvirtualenv --python=/usr/bin/python3.7 uploads-laum

unrar x laum.rar

Path to Django Top Folder =         /home/josemachado/laum
Name of the Project = laum
Virtual Environment = (uploads-laum) /home/josemachado/.virtualenvs/uploads-laum

pip install -r requirements.txt





# At the end of wsgi file
# then:
from django.core.wsgi import get_wsgi_application
from django.contrib.staticfiles.handlers import StaticFilesHandler
application = StaticFilesHandler(get_wsgi_application())