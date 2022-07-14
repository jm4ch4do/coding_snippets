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


        
''' -------------------------- TRANSACTIONS ---------------------- '''
# if you need the databases to be flush between tests
@pytest.mark.django_db(transaction=True)
def test_spam():
    pass  # test relying on transactions

