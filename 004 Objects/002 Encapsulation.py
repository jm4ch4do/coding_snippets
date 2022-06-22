#--------------------ENCAPSULATION--------------------
# Bundling of data and methods that act on that data into a single unit (class)
# I.E. The class acts like a capsule holding attributes and methods and restricts
# access to its internal elements to prevents unwanted changes. From the outside
# you can only see the public members of the class
# Getters & Setters are commonly used for encapsulation
# Abstraction: Show only the essential attributes and hide unncessary details from the user.
# The Class will be divided into Interface and Implementation

# *** Public Attributes ***
class Car:

    def __init__(self, brand, model, year):
        self.brand = brand
        self.model = model
        self.year = year

my_car = Car("Porsche", "911 Carrera", 2020)
my_car.year = 5600  # the user may introduce invalid info

# *** Non-Public by Convention **
# Changing to non-public using convention
# It can still be accessed but by convention you know you shouldn't
class Car:

    def __init__(self, brand, model, year):
        self.brand = brand
        self.model = model
        self._year = year

my_car = Car("Porsche", "911 Carrera", 2020)
my_car._year = 5600  # by convention the programmer knows he is not supposed to do this
                     # That's why we call it not public since it can be access so is not entirely Private

# *** Name Mangling **
# You can also add __ before the attribute name which will transform the name of the variable internally
__year  # by doing this
_Car__year  # it gets transform into this which is even more difficult to access yet not impossible

# This is mostly used to avoid name clashes with subclasses and the prefered Non-Public method is to use _ 
class Backpack:

    def __init__(self):
        self.__items = []

my_backpack = Backpack()
print(my_backpack._Backpack__items)

# remember that __name__ is for special methods so it will not trigger name mangling


#--------------------GETTERS SETTERS--------------------
# Provide way to access encapsulated variables
# Getters
class Movie:

    def __init__(self, title, rating):
        self._title = title
        self.rating = rating

    def get_title(self):
        return self._title

my_movie = Movie("The Godfather", 4.8)

print(my_movie.get_title())

# Setters (mostly used to validate before storing the value)
class Dog:

    def __init__(self, name, age):
        self._name = name
        self.age   = age
        
        def get_name(self):
            return self._name

        def set_name(self, new_name):
            if isinstance(new_name, str) and new_name.isalpha():
                self._name = new_name
            else:
                print("Please enter a valid name")

my_dog = Dog("Nora", 8)
my_dog.set_name("Norita")


#--------------------PYTHONIC WAY OF ACCESING PROPERTIES--------------------
name = property(get_age, set_age)  # define age as property inside the Class

my_dog.name = "Victor"  # this will go through the set and get methods


#--------------------EVEN BETTER WAY--------------------
class Movie:

    def __init__(self, title, rating):
        self.title = title
        self._rating = rating

    @property
    def rating(self):
        return self._rating

    @rating.setter
    def rating(self, new_rating):
        if 1.0 <= new_rating <= 5.0:
            self._rating = new_rating
        else:
            print("Please enter a valid rating.")

    @rating.deleter
    def rating(self):
        del self._rating

favorite_movie = Movie("Titanic", 4.3)
favorite_movie.rating = 4.5
print(favorite_movie.rating)
