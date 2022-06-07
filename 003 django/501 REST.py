# https://www.django-rest-framework.org/
' ------------------------------ INSTALL ------------------------------ '
pip install djangorestframework

# add to installed apps
INSTALLED_APPS = [
    'rest_framework',
]


' ------------------------------ FIRST EXAMPLE ------------------------------ '
# also you must create new file serializers.py inside the app
from rest_framework import serializers
from .models import Book

class BookSerializer(serializers.ModelSerializer):

    class Meta:
        model = Book
        fields = ['id', 'title', 'description', 'price']
        
        
# We need a view to match this serializer
from .serializers import BookSerializer
from rest_framework import viewsets
        
class BookViewset(viewsets.ModelViewSet):
    serializer_class = BookSerializer
    queryset = Book.objects.all()
    
    
# We also need to add routers in the url.py file
from django.urls import path, include
from . import views
from rest_framework import routers
from .views import BookViewSet

router = routers.DefaultRouter()
router.register('books', BookViewSet)

urlpatterns = [
    path('', include(router.urls)),
]


# Access the web viewer to see how the API works returning data

http://127.0.0.1:8000/books/    # list of all books
http://127.0.0.1:8000/books/1/  # access book with id=1
        

' ------------------------------ CUSTOM FUNCTION ------------------------------ '
# Custom functions allow you to return whathever you want to a given request
# This example updates the rating if you are providing a rating for an existing pair movie/user
# otherwise, it creates a new rating

from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action
from .models import Movie, Rating
from .serializers import MovieSerializer, RatingSerializer
from django.contrib.auth.models import User


class MovieViewSet(viewsets.ModelViewSet):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer

    @action(detail=True, methods=['POST'])
    def rate_movie(self, request, pk=None):
        if 'stars' in request.data:

            movie = Movie.objects.get(id=pk)
            stars = request.data['stars']
            user = User.objects.get(id=1)

            try:
                rating = Rating.objects.get(user=user.id, movie=movie.id)
                rating.stars = stars
                rating.save()
                serializer = RatingSerializer(rating, many=False)
                response = {'message': 'Rating updated', 'result': serializer.data}
                return Response(response, status=status.HTTP_200_OK)
            except:
                rating = Rating.objects.create(user=user, movie=movie, stars=stars)
                serializer = RatingSerializer(rating, many=False)
                response = {'message': 'Rating created', 'result': serializer.data}
                return Response(response, status=status.HTTP_200_OK)


        else:
            response = {'message': 'Please provide starts'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

# Using postman access this url to test using POST and use key = stars, value = 3
http://127.0.0.1:8000/api/movies/1/rate_movie
        
        
' ------------------------------ CALCULATIONS AND SUMMARIES ------------------------------ '
# You can add calculations and summaries by creating functions inside Model and the Serializing
# models.py
class Movie(models.Model):
    title = models.CharField(max_length=32)
    description = models.TextField(max_length=360)

    def no_of_ratings(self):
        ratings = Rating.objects.filter(movie=self)
        return len(ratings)

    def avg_rating(self):
        sum = 0
        ratings = Rating.objects.filter(movie=self)
        for rating in ratings:
            sum += rating.stars

        if rating == 0:
            return 0
        else:
            avg = sum / len(ratings)
            return avg
        
    
# serializer.py
class MovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Movie
        fields = ('id', 'title', 'description', 'no_of_ratings', 'avg_rating')

        
        
' ------------------------------ POSTMAN/TOKEN ------------------------------ '
# using postman software you may replicate this get request to see data.
# you can aslo use POST to create new, PUT to update and DELETE to erase
# you can aslo use POST to create new, PUT to update and DELETE to erase

# For security we need to use a token
# The user will log in with user and password and afterwards he'll be given a token
# Every request needs to come together with this token

# add token to installed apps
INSTALLED_APPS = [
    'rest_framework.authtoken',
]

# you need to migrate after that to get a new table named Tokens
python manage.py migrate 

# in the main urls file you need to create a path for authentication
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('movies.urls')),
    path('auth/', obtain_auth_token),  # this is the new line
]

# after this is set up you need to make a POST request with your
# user and password to get the token back. You need to manually create 
# a token first using admin panel


' ------------------------------ PERMISSION ------------------------------ '
# Add to settings to restrict framework to authenticated users
REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
        # 'rest_framework.permissions.AllowAny',       # choice to allow any (default)
    )
}

# You need to tell the view is going to use tokens for authentication
from rest_framework import viewsets
from .serializers import BookSerializer
from .models import Book
from rest_framework.authentication import TokenAuthentication  # new line


class BookViewSet(viewsets.ModelViewSet):
    serializer_class = BookSerializer
    queryset = Book.objects.all()
    authentication_classes = (TokenAuthentication,)  # new line
    

# now you'll need to modify the HEADER of your request to include the token
Authorization       Token b586403618c39464c5d2b7c01387617dc5b8a7f


# besides the default choice in SETTINGS you can have a different access level per class
# For example, this forces IsAuthenticated for this class
from rest_framework.permissions import IsAuthenticated

class BookViewSet(viewsets.ModelViewSet):
    serializer_class = BookSerializer
    queryset = Book.objects.all()
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)














