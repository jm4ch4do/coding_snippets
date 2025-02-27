# ORM: Object Relational Mapper
' -------------------------- APPLY CHANGES --------------------------- '
# every time you create or update a model you must execute
python manage.py makemigrations  # prepares migrations to be executed on the database
								 # creates a file in /myapp/migrations

python manage.py migrate # executes migrations previously prepared


' ---------------------- EXAMPLE BASIC PARAMETERS ---------------------- '
class Book(models.Model):
    title = models.CharField(blank=False)  # it's not allowed to be blank
    title = models.CharField(blank=True, null=True)  # it will store Null when is blank
    title = models.CharField(blank=True, default='my_value')  # default value for blank
    title = models.CharField(unique=True)  # you can't have two books with the same title
    CHOICES_CUSTOMER_STATUS = (
        (0, 'Active'),
        (1, 'Inactive')
    )
    status = models.SmallIntegerField(choices=CHOICES_CUSTOMER_STATUS)  # allow only these set of values
    title = models.CharField(blank=False, unique=True, max_length=200)
    description = models.TextField(max_length=256, blank=True)
    price = models.DecimalField(default=0, max_digits=5, decimal_places=2)
    last_modified = models.DateField(auto_now=True)
    published = models.DateField(blank=True, null=True, default=None)
    cover = models.FileField(upload_to='covers/', blank=True)
    cover = models.ImageField(upoload_to='covers/', blank=True)
    
'CharField    TextField    Integer    BigInteger    DecimalField     DateField    TimeField    FileField    ImageField'
'             larger text                                                                                   Only images'



' ---------------------- EXAMPLE REPORTER MODEL ---------------------- '
from django.db import models

class Reporter(models.Model):
    full_name = modelsj.CharField(maxlength=70)
    
    def __str__(self):
        return self.fullname
    
class Article(models.Model):
    pub_date = models.DateField()
    headline = models.CharField(max_length=200)
    content = models.TextField()
    reporter = models.ForeignKey(Reporter, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.headline

    
' ------------------ EXAMPLE QUESTION/CHOICE MODELS ------------------ '
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    
' ------------------------ EXAMPLE POST MODEL ------------------------ '
from django.db import models  # django ORM for creating models
from django.utils import timezone  # for getting current timezone
from django.contrib.auth.models import User  # default django user model

class Post(models.Model):
	# title is a field with a restricted length
	title = models.CharField(max_length=100)

	# content is a field that may have a lot of data
	content = models.TextField()

	# date_posted will store the current time and date on creation
	date_posted = models.DateTimeField(default=timezone.now)
	
	# relationship one to many -> one author may have several posts
	author = models.ForeignKey(User, on_delete=models.CASCADE)  # if a user is deleted, all his posts will also be deleted
	
	# define what the object will show when printed
	def _str_(self):
		return self.title  # shows title when printed 
