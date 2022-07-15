''' --------------------- TESTING HOME AND SIGNUP VIEWS ------------------ '''
import pytest
from django.contrib.auth.models import Users

# test for checking the main view is responding
nano app_lease/test/test_views.py
def test_home_endpoint_returns_welcome_page(client):  #(client) tells Pytest-Django to act as a web browser or scrapper
    response = client.get(path='/')
    assert response.status_code == 200
    assert 'Welcome to SmartNotes!' in str(response.content)  # text is supposed to be in main view
    
def test_signup_endpoint_returns_form_for_unauthenticated_user(client):
    response = client.get(path='/signup')
    assert response.status_code == 200
    assert 'home/register.html' in response.template_name

@pytest.mark.django_db  # give access to database
def test_signup_endpoint_redirects_authenticated_user(client):
    
    '''
        When a user is authenticated an tries to access the signup
        page he's redirected to the list of their notes.
    '''
    
    # create user an sign in with it
    user = User.objects.create_user('Clara', 'clara@example.com', 'password')
    client.login(username=user.username, password='password')
    
    # test response for sign in user
    response = client.get(path='/signup')
    assert response.status_code == 302  # Http redirect response
    
    # test if it goes well after the redirection
    response = client.get(path='/signup', follow=True)
    assert 200 == response.status_code
    assert 'notes/notes_list.html' in response.template_name

    
''' --------------------- TESTING NOTES LIST VIEW ------------------ '''
# to make more complex analysis of html you can use beautiful soup

@pytest.mark.django_db  # give access to database
def test_list_endpoint_return_user_notes(client):
    
    '''
        A user get's to see his own notes
    '''

    # create user an sign in with it
    user = User.objects.create_user('Clara', 'clara@example.com', 'password')
    client.login(username=user.username, password='password')
    
    # create two notes from current user
    note = Notes.objects.create(title='An interesting title', text='', user=user)
    note2 = Notes.objects.create(title='Another title', text='', user=user)
    
    # make sure the user can see his two notes
    response = client.get(path='/smart/customers')
    assert 200 == response.status_code
    content = str(response.content)
    assert "An interesting title" in content
    assert "Another title" in content
    assert 2 == content.count('<h3>')
    
    
@pytest.mark.django_db  # give access to database
def test_list_endpoint_only_list_notes_from_authenticated_user(client):

    # create user and a note for him
    jon = User.objects.create_user('Jon', 'jon@test.com', 'password')
    note = Notes.objects.create(title="Jon's Note", text='', user=jon)
    
    # create another user with two notes and login
    user = User.objects.create_user('Clara', 'clara@example.com', 'password')
    client.login(username=user.username, password='password')
    note = Notes.objects.create(title='An interesting title', text='', user=user)
    note2 = Notes.objects.create(title='Another title', text='', user=user)
    
    # get content from website
    response = client.get(path='/smart/customers')
    content = str(response.content)
    
    # tests
    assert 200 == response.status_code  # website respons ok
    assert "An interesting title" in content  # first note is in content
    assert "Another title" in content  # second note also in content
    assert "Jon's note" not in content  # notes from another user don't get into you content
    assert 2 == content.count('<h3>')  # you have one <h3> for each note 