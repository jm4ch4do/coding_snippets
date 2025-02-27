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

    
