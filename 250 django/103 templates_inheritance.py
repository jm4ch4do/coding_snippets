' ---------------------------------------------------------------------------------------- '
' --------------------------------------- BASICS ----------------------------------------- '
' ---------------------------------------------------------------------------------------- '



' ------------------------- BASE TEMPLATE -------------------------- '
# base.html
# it has three blocks (block title, block sidebar, block content)
# content within the father template is used as fallback
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <title>{% block title %}My amazing site{% endblock title %}</title>
</head>

<body>
    <div id="sidebar">
        {% block sidebar %}
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/blog/">Blog</a></li>
        </ul>
        {% endblock sidebar %}
    </div>

    <div id="content">
        {% block content %}{% endblock content %}
    </div>
</body>
</html>


' -------------------------- BLOCK TITLE --------------------------- '
{% extends "base.html" %}

{% block title %}My amazing blog{% endblock %}

{% block content %}
{% for entry in blog_entries %}
    <h2>{{ entry.title }}</h2>
    <p>{{ entry.body }}</p>
{% endfor %}
{% endblock %}









































' ----------------------------- EXTEND ----------------------------- '
# file /base.html
some_html
{% block content %}{% endblock %}
some_html

# file /home.html  (file called by the view)
{% extends "blog/base.html" %}
{% block content %}
	{{ my_var }}  # usually you add more content
{% endblock content %}