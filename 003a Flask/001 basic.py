' ---------------------------- BASICS ----------------------------- '
1. Flask Backend
2. Jinja Template Engine
3. Werkzeug WSGI Toolkit  - 
   WSGI is the Web Server Gateway Interface. It is a specification that describes how a web server 
   communicates with web applications, and how web applications can be chained together to process one request.
    
    
' -------------------------- CMD BASICS --------------------------- '
pip install flask  # install
flask --version  # see version
python -m flask run  # start app
python -m flask --debug run  # start app with debug enabled


' ------------------------ INJECTION SCAPE ------------------------- '
# Use escape to avoid injection if not using Jinja
from markupsafe import escape
@app.route("/<name>")
def hello(name):
    return f"Hello, {escape(name)}!"


' ------------------------ INI PROJECT ------------------------- '
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world(): # put application's code here
    return 'Hello World!'


if __name__ == '__main__':
    app.run()
    
    # for debugging use instead
    # app.run(debug=True)
    
    # you can also type "set FLASK_DEBUG=1" in cmd
    
# __name__ is set to '__main__' when the interpreter is running this module directly. If the interpreter ran another module and this other module called the current module(or file), then the __name__ is set to the file's name.