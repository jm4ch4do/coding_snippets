''' -------------------------- PATTERNS/PARADIGM ----------------------- '''
- Arrange: # prepare for test. Create data, import modules, connect to API.
- Act: # perform an action. Call function, call restAPI. Usually triggers a response.
- Assert: # Evaluates the outcomes against the expected outcome. Return True if test has passed.
    
    
''' ------------------------------ FIXTURES --------------------------- '''
# Fixtures are actions that can be run before an action
@pytest.fixture
def fixture_1():
    print('run-fixture-1')
    return 1

def text_example1(fixture1):
    num = fixture_1
    assert num == 1

    
''' ------------------------------ FILE FOR FIXTURES --------------------------- '''
# you can put the fixtures in the same file as the test or
# you can put fixtures in the file conftest.py since pytest will look for that name
nano conftest.py
import pytest 
from django.contrib.auth.models import User

@pytest.fixture()
def user_1(db):
    user = User.objects.create_user("test-user")
    print('create-user')
    return user
    
''' ----------------------- WHEN TO EXECUTE FIXTURES ------------------- '''
# By default, fixtures are run one per function but it may be enough to 
# prepare your data just once for several functions, so you have this choices:

# function  Run once per test
# class     Run once per class of tests
# module    Run once per module
# session   Run once per session

@pytest.fixture(scope="session")
def fixture_1():
    print('run-fixture-1')
    return 1


# Execute fixtures at start and also at the end
@pytest.fixture
def yield_fixture():
    print('Start Test Phase')
    yield 6
    print('End Test Phase')
    
def test_example(yield_fixture):
    print('run-example-1')
    assert yield_fixture == 6
    
    
''' -------------------------- DATABASE ACCESS ---------------------- '''
# marks one function to have access to database
import pytest
@pytest.mark.django_db  
def test_my_user():
    me = User.objects.get(username='me')
    assert me.is_superuser

# marking a whole module
import pytest
pytestmark = pytest.mark.django_db  

# marking a whole class
@pytest.mark.django_db
class TestUsers:
    pytestmark = pytest.mark.django_db
    def test_my_user(self):
        me = User.objects.get(username='me')
        assert me.is_superuser
        
# EXAMPLE: database access within fixture
@pytest.fixture
def user_1(db):
    return User.objects.create_user("test-user")

@pytest.mark.django_db
def test_set_check_password(user_1):
    assert user_1.username == "test-user"
        
        
''' -------------------------- TEST DATABASES ---------------------- '''
# Modifications in the database are run in a test database
# In addition, data created at each function does not persist to the next function

# Example, this two tests will pass because the user created in the first 
# one doesn't persist for the second test
@pytest.mark.django_db
def test_user_create():
    User.objects.create_user('test', 'test@test.com', 'test')
    count = User.objects.all().count()
    print(count)
    assert User.objects.count() == 1


@pytest.mark.django_db
def test_user_create2():
    User.objects.create_user('test', 'test@test.com', 'test')
    count = User.objects.all().count()
    print(count)
    assert User.objects.count() == 1


''' --------------- FIXTURE EXAMPLE FOR CREATING USERS ------------ '''
# Fixtures will help you reuse code
@pytest.fixture
def logged_user(client):
    user = User.objects.create_user('Clara', 'clara@example.com', 'password')
    client.login(username=user.username, password='password')
    return user
    
@pytest.mark.django_db  # give access to database
def test_list_endpoint_only_list_notes_from_authenticated_user(client, logged_user):

    note = Notes.objects.create(title='a title', text='', user=logged_user)
    note2 = Notes.objects.create(title='Another title', text='', user=logged_user)

        
''' -------------------------- TRANSACTIONS ---------------------- '''
# if you need the databases to be flush between tests
@pytest.mark.django_db(transaction=True)
def test_spam():
    pass  # test relying on transactions

