' ---------------------------- DJANGO SHELL -------------------------- '
python manage.py shell  # open django shell for working with models
exit()  # closes the shell

' -------------------------- DJANGO SHELL PLUS ----------------------- '
pip install jupyter ipython django-extensions   # install
INSTALLED_APPS = [                              # register
    ...
    'django_extensions',
]
python manage.py shell_plus --notebook          # execute

                                                
# Enable only when debugging for using jupyter notebook shell-plus (settings.py)
if DEBUG is True:
    os.environ["DJANGO_ALLOW_ASYNC_UNSAFE"] = "true"

from django.db.models import Model              # import all models in notebook 
                                                # (shift + plus to execute)                                                
from app_trucks.models import *
my_pay_rate = Company.objects.select_pay_rate(company_id=1)


' --------------------------- IMPORT MODELS -------------------------- '
# models must be imported to work with them
from news.models import Article, Reporter

# you can also just import them all
from accounts.model import *


' ---------------------------- TIME HANDLING ------------------------- '
from django.utils import timezone
current_year = timezone.now().year

# function in model to find inf items was published in less than a day
def was_published_recently(self):
    return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

# create field and store current date and time
date_posted = models.DateTimeField(default=timezone.now)


' --------------------------- SELECT RECORDS ------------------------- '
# import two tables
from blog.models import Post  # myapp is a blog that has posts
from django.contrib.auth.models import User # default django user model

# you could also import your own User (let's call it Customers)
from accounts.models import *
customers = Customer.object.all()

# get all records
all_users = User.objects.all()  # returns <QuerySet [<User: jose>, <User: TestUser>]>
                                # use print(all_users) to see the results

# get first or last user
first_user = User.objects.first(), User.objects.last()

# get user by name (may return multiple results if field is has not unique value)
my_user = User.objects.filter(username='jose')

# get user with id = 1 (the get method always returns a single result)
my_user = User.objects.get(id=1)

# get reporter named John somethingelse
my_user = Reporter.objects.get(full_name__startswith='John')  # gets 'John Smith'

# get reporter having string in name
my_user = Reporter.objects.get(full_name__contains='mith')  # gets also 'John Smith'

# get all posts from an specific user
user = User.objects.filter(username='jose').first()
Post.objects.filter(author=user)

# get all posts better way
user = User.objects.filter(username='jose').first()
user.posts_set.all()

' ---------------------- ACCESSING RELATED OBJECTS ------------------- '
# from the Choice object find the parent question that has a year in the pub_date field same as current year
from django.utils import timezone
current_year = timezone.now().year
Choice.objects.filter(question__pub_date__year=current_year)

# from the currently selected question find the choice that starts with 'Just hacking' and delete it
c = q.choice_set.filter(choice_text__startswith='Just hacking')
c.delete()

# accessing related records from table Choice, original table is Question(q is an instance of Question)
q.choice_set.all()

# accessing related question from choice
c.question


' --------------------------- CREATE/DELETE RECORDS ------------------------- '
# assumming my_user exists

# create new post with related user
post_1 = Post(title='Blog 1', content='First Post Content', author=my_user)
post_1.save()
Post.objects.all()  # now returns <QuerySet [<Post: Post object (1)>]>
					# which really doesn't give any information about the object
					# you have to define a __str__ method in the Blog class so it will show the title when printed

# create an article
from datetime import date
r = Reporter.objects.get(full_name='John Smith')
a = Article(pub_date=date.today(), headline='Django is cool', content='Yeah.', reporter=r)
a.save()

# create a question and save time now
from django.utils import timezone
q = Question(question_text="What's new?", pub_date=timezone.now())
q.save()
        
# access user data from post
post_1.author.email  # return email from post author (table users)

# another way of creating post for user
user.post_set.create(title='Blog 3', content='Third Blog Content!')

# delete reporter
r = Reporter.objects.get(full_name='John Smith')
r.delete()

# delete choices of a give question
c = q.choice_set.filter(choice_text__startswith='Just hacking')
c.delete()


' ----------------------- CREATE RELATED RECORDS --------------------- '
# create related records from the main table
# in the poll application that has question where a Question has several Choices
q = Question.objects.get(pk=1)
q.choice_set.all()  # there is nothing yet
q.choice_set.create(choice_text='Not much', votes=0)
q.choice_set.create(choice_text='The sky', votes=0)
c = q.choice_set.create(choice_text='Just hacking again', votes=0)
c.question # get question from the choice object
q.choice_set.all()  # get all choices for this question
q.choice_set.count()  # couclnt choices for this question

' ----------------------------- MODIFY DATA -------------------------- '
# view id of record
my_user = User.objects.filter(username='jose').first()
my_user.id  # shows user id

