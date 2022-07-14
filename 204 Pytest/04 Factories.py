''' -------------------------- NEED ----------------------- '''
# this code won't work when trying to use the fixture for a session

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
    
    
''' -------------------------- FACTORY ----------------------- '''
# A fixture that creates objects should be implemented as a Factory
