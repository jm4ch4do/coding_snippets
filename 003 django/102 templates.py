' ---------------------------------------------------------------------------------------- '
' --------------------------------------- BASICS ----------------------------------------- '
' ---------------------------------------------------------------------------------------- '

' ----------------------- CONTEXT VARIABLES ------------------------ '
# print myvar passed in context from view
{{ myvar }}


' ------------------------------ URL ------------------------------- '
#  print the url set in urls.py with the attribute name
<a class="nav-item nav-link" href="{% url 'blog-home' %}">Home</a>

# print url using namespace
<a href="{% url 'polls:detail' question.id %}">{{ question.question_text }}</a>
# url must be configured like this in urls.py
app_name = 'polls'
urlpatterns = [
  path('<int:question_id>/', views.detail, name='detail'),
]

# print URL only if it exist
{% url 'some-url-name' as the_url %}
{% if the_url %}
  <a href="{{ the_url }}">Link to optional stuff</a>
{% endif %}


' ---------------------------- FILTERS ----------------------------- '
# get stored data in an specific format
{{ post.date_posted|date:"F d, Y"}}  # August 28, 2018

# filter can also be used as a tag except for escape and safe filters
# lowercase and escape
{% filter force_escape|lower %}
    This text will be HTML-escaped, and will appear in all lowercase.
{% endfilter %}


' -------------------------- STATIC FILES -------------------------- '
# put this on top of every template file that uses static files
{% load static %}

# link to static css file registered at app level in folder /template/pools/
<link rel="stylesheet" type="text/css" href="{% static 'polls/style.css' %}">

# link to static bootstrap file registered at project level in the folder /css
<link rel="stylesheet" type="text/css" href="{% static 'css/bootstrap.min.css' %}">

# link to static css file registered at project level in the folder /myapp/static/myapp/css/
<link rel="stylesheet" type="text/css" href="{% static 'myapp/css/main.css' %}">



' ---------------------------------------------------------------------------------------- '
' --------------------------------------- OTHERS ----------------------------------------- '
' ---------------------------------------------------------------------------------------- '

' ---------------------------- COMMENTS ---------------------------- '
# los comentarios no aparecerán en el html renderizado
{% comment "Optional note" %}
    <p>Commented out text with {{ create_date|date:"c" }}</p>
{% endcomment %}

' ------------------------------ DATE ------------------------------ '
# displays It is the 4th of September
It is the {% now "jS \o\f F" %}


' ------------------------- SECURITY/DEBUG ------------------------- '
# just put this in every form
<form action="{% url 'polls:vote' question.id %}" method="post">
{% csrf_token %}

# printing debugging information
{% debug %}


' ---------------------------- ESCAPING ---------------------------- '
# This tag auto-escapes variable values. You can disable auto-escaping with:
{% autoescape off %}
    {% firstof var1 var2 var3 "<strong>fallback value</strong>" %}
{% endautoescape %}

# Or if only some variables should be escaped, you can use:
{% firstof var1 var2|safe var3 "<strong>fallback value</strong>"|safe %}



' ---------------------------------------------------------------------------------------- '
' ------------------------------------- CONDITIONALS ------------------------------------- '
' ---------------------------------------------------------------------------------------- '

' ------------------------------ IF -------------------------------- '
# change page title if var 'title' exists
{% if title %}
	<title>Django Blog - {{ title }}</title>
{% else %}
	<title>Django Blog </title>
{% endif %}

# full if
{% if athlete_list %}
    Number of athletes: {{ athlete_list|length }}
{% elif athlete_in_locker_room_list %}
    Athletes should be out of the locker room soon!
{% else %}
    No athletes.
{% endif %}


# LOGICAL Operators
{% if athlete_list and coach_list %}
    Both athletes and coaches are available.
{% endif %}

{% if not athlete_list %}
    There are no athletes.
{% endif %}

{% if athlete_list or coach_list %}
    There are some athletes or some coaches.
{% endif %}

{% if somevar == "x" %}
{% if somevar != "x" %}
{% if somevar > 0 %}
{% if somevar <= 100 %}
{% if "bc" in "abcdef" %}
{% if "hello" in greetings %}
{% if somevar is True %}
# filter may be used inside if operators
{% if messages|length >= 100 %}


' --------------------------- FIRST OF ----------------------------- '
# prints the first variable which is not False 
{% firstof var1 var2 var3 "there are no winners" %}

# Or if only some variables should be escaped, you can use:
{% firstof var1 var2|safe var3 "<strong>fallback value</strong>"|safe %}

# to store the output inside a variable.
{% firstof var1 var2 var3 as value %} 



' ---------------------------------------------------------------------------------------- '
' ---------------------------------------- CYCLES ---------------------------------------- '
' ---------------------------------------------------------------------------------------- '

' -------------------------- FOR ---------------------------- '
# print every record passed as context
{% for post in posts %}
	<article class="media content-section">
		<div class="media-body">
			<div class="article-metadata">
				<a class="mr-2" href="#"> {{ post.author }} </a>  # print variable author in dict post
			</div>
			<h2><a class="article-title" href="#"> {{ post.title }}</a></h2>
			<p class="article-content"> {{ post.content }}</p>
		</div>
	</article>
{% endfor %}

# print every athlete on the list and error message if there is none
<ul>
  {% for athlete in athlete_list %}
      <li>{{ athlete.name }}</li>
  {% empty %}
      <li>Sorry, no athletes in this list.</li>
  {% endfor %}
</ul>

# reversed list
{% for obj in list reversed %}

# loop over a list of lists
{% for x, y in points %}
    There is a point at {{ x }},{{ y }}
{% endfor %}

# loop over a dictionary
{% for key, value in data.items %}
    {{ key }}: {{ value }}
{% endfor %}

# The for loop sets a number of variables available within the loop:
Variable	           Description
forloop.counter	       The current iteration of the loop (1-indexed)
forloop.counter0	   The current iteration of the loop (0-indexed)
forloop.revcounter	   The number of iterations from the end of the loop (1-indexed)
forloop.revcounter0	   The number of iterations from the end of the loop (0-indexed)
forloop.first	       True if this is the first time through the loop
forloop.last	       True if this is the last time through the loop
forloop.parentloop	   For nested loops, this is the loop surrounding the current one


' --------------------------- ROTATIONS ---------------------------- '
# puts 'odd' and then 'even'
{% cycle 'odd' 'even' %}

# you can also use more than two elements in the rotation
{% for o in some_list %}
    <tr class="{% cycle 'row1' 'row2' 'row3'%}">
        ...
    </tr>
{% endfor %}

# you can also put a name in the cycle
<tr>
    <td class="{% cycle 'row1' 'row2' as rowcolors %}">...</td>
    <td class="{{ rowcolors }}">...</td>
</tr>
<tr>
    <td class="{% cycle rowcolors %}">...</td>
    <td class="{{ rowcolors }}">...</td>
</tr>

# the previous code outputs
<tr>
    <td class="row1">...</td>
    <td class="row1">...</td>
</tr>
<tr>
    <td class="row2">...</td>
    <td class="row2">...</td>
</tr>


