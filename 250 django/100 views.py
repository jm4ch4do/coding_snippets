from django.http import HttpResponse
from django.shortcuts import render

# basic view with hello message
def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

# simple view passing no information
def home(request):
  return render(request, 'accounts/dashboard.html')

# elegant simple view
def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

' ----------------------- PASS DATA TO TEMPLATE ---------------------- '
# pass dummy data to template
posts = [
	{
		'author'  : 'CoreyMS',
		'title'   : 'Blog Post 1',
		'content' : 'First Post Content',
		'date_posted': 'August 27, 2018',
	},
	{
		'author'  : 'Jane Doe',
		'title'   : 'Blog Post 2',
		'content' : 'Second Post Content',
		'date_posted': 'August 28, 2018',
	},
]

def home(request):
	context = {
		'posts': posts
	}

	# the template in /myapp/templates/myapp/home.html will handle the variable post
	return render(request, 'myapp/home.html')


# you can also pass directly the data
def about(request):
	return render(request, 'blog/about.html', {'title': 'About'})


# pass dummy data from database
from .models import Post

def home(request):
	context = {
		'posts': Post.objects.all()
	}
	return render(request, 'myapp/home.html')


