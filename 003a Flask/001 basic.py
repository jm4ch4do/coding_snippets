' ---------------------------- BASICS ----------------------------- '
1. Flask Backend
2. Jinja Template Engine
3. Werkzeug WSGI Toolkit  - 
   WSGI is the Web Server Gateway Interface. It is a specification that describes how a web server 
   communicates with web applications, and how web applications can be chained together to process one request.
    
    
' ---------------------------- CMD BASICS ----------------------------- '
pip install flask  # install
flask --version  # see version
python -m flask run  # start app
python -m flask --debug run  # start app with debug enabled


' ---------------------------- INJECTION SCAPE ----------------------------- '
# Use escape to avoid injection if not using Jinja
from markupsafe import escape
@app.route("/<name>")
def hello(name):
    return f"Hello, {escape(name)}!"