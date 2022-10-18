' ---------------------------- TEMPLATES ----------------------------- '
# templates go in the template folder
/application.py
/templates
    /hello.html

# you call the template like this
from flask import render_template

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)

# this is a template example
<!doctype html>
<title>Hello from Flask</title>
{% if name %}
  <h1>Hello {{ name }}!</h1>
{% else %}
  <h1>Hello, World!</h1>
{% endif %}

# Inside templates you also have access to the config, 
# request, session and g 1 objects as well as the url_for()
# and get_flashed_messages() functions.


' ----------------------- TEMPLATE INHERITANCE ------------------------ '
https://flask.palletsprojects.com/en/2.2.x/patterns/templateinheritance/



