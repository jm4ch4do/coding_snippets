''' -------------------------- NEED ----------------------- '''
# this code won't work when trying to use the fixture for a session
# you need to make a more complex implementation that involces nested functions
# so you can return a function instead of a value, this is called a Factory

@pytest.fixture(scope="session")  # if you remove the session it works
def user_1(db):
    user = User.objects.create_user("test-user")
    print('create-user')
    return user

def test_set_check_password1(user_1):
    print('check-user1')
    assert user_1.username == 'test-user'
    
def test_set_check_password2(user_1):
    print('check-user2')
    assert user_1.username == "test-user"
    
    
''' ----------------------- FACTORY BOY -------------------- '''
# Factory Boy makes it easy to implemented factories
pip install pytest-factoryboy
nano test/factories.py
from faker import Faker
fake = Faker()

# attach User model to a User Factory
import factory
from django.contrib.auth.models import User

class UserFactory(factory.django.DjangoModelFactor):
    class Meta:
        model = User
        
    username = fake.name()
    is_staff = 'True'

    
nano conftest.py
import pytest
from pytest_factoryboy import register
from test.factories import UserFactory

register(UserFactory)


nano test/test_ex1.py
def test_new_user(user_factory):
    user = user_factory.build()   # creates an object but does not store in the test db
    print(user.username)
    assert True
    
>> pytest -rP

# For storing in the database we can use this
from django.contrib.auth.models import User
def test_new_user(db, user_factory):
    user = user_factory.create()   # stores in the test db
    count = User.objects.all().count()
    print(count)
    print(user.username)
    assert True
    
# or use this other strategy to access database
from django.contrib.auth.models import User
@pytest.mark.django_db
def test_new_user(user_factory):
    user = user_factory.create()   # stores in the test db
    count = User.objects.all().count()
    print(count)
    print(user.username)
    assert True
    
# or you can also put the factory code inside a fixture
nano conftest.py
import pytest
from pytest_factoryboy import register
from test.factories import UserFactory

register(UserFactory)

@pytest.fixture
def new_user(db, user_factory):
    user = user_factory.create()
    return user

nano test/test_ex1.py
def test_example(new_user):
    user = new_user
    print(user.username)
    assert True if user.username else False
    
    
''' ------------------- FACTORY FOR RELATED TABLE ---------------- '''