''' ---------------------------- CLASS WITH ATTRIBUTES --------------------------  '''

# simple class example
class Dog():

	# class object attribute
	species = "mammal"

	def __init__(self, breed, name):  # initialization method (special method)
		self.breed = breed  # attributes
		self.name = name

mydog = Dog(breed = "Lab", name = "Sammy")
otherdog = Dog("Huskie", "Tommy")
print(mydog.breed)
print(otherdog.breed)  # two dogs with different data
print(mydog.species) # this is the same for both dogs

''' ----------------------------- CLASS WITH METHODS ----------------------------  '''
class Circle():

	pi = 3.14

	def __init__(self, radius = 1):
		self.radius = radius

	# method
	def area(self): # method uses self for Circle
		return self.radius * self.radius * Circle.pi

	def set_radius(self, new_r):
		self.radius = new_r

myc = Circle()
print(myc.area()) # print the default result

myc.radius = 100
print(myc.area()) # print after changing value

myc.set_radius(200)
print(myc.area()) # print after changing through set

''' -------------------------------- INHERITANCE --------------------------------  '''
class Animal():

	def __init__(self, name):
        self.name = name
		print("ANIMAL CREATED")

	def whoAmI(self):
		print("ANIMAL")

	def eat(self):
		print("EATING")


class Dog(Animal):

	def __init__(self, name):
        super().__init__(name)  # parent constructor
		print("DOG CREATED")

	def bark(self):
		print("WOOF")

	def eat(self):
		print("DOG EATING")

myd = Dog()
myd.whoAmI() # animal methods still work
myd.bark() # new method in dog
myd.eat()  # this method was overwritten

''' ------------------------------ SPECIAL METHODS ------------------------------  '''
class Book():
	def __init__(self,title, author, pages):
		self.title = title
		self.author = author
		self.pages = pages

	def __str__():  # string representation of the object
		return "Title: {}, Author: {}, Pages: {}".format(self.title, self.author, self.pages)

	def __len__(): # len representation
		return self.pages

	def __del__(self):
		print("a book is destroyed!")

b = Book("Python", "jose", 200)
print(b)  # this will print an object unless you define __str__ function
		  # this prints Title: Python, Author: jose, Pages: 200
print([1, 2, 3]) # this uses the string representation in the list to print the values in the list


print(len(b))  # this will result in error unless you define __less__method
			   # returns the number of pages

del(b)  # this calls the __del__ special function


''' ----------------------------- MODULES AND PACKAGES --------------------------  '''
# mymodule.py
def func_in_module():
	print("I AM INSIDE THE MYMODULE.PY FUNCTION")

# myprogram.py (firts way of importing)
import mymodule
mymodule.func_in_module()

# myprogram.py (second way of importing)
import mymodule as mm
mm.func_in_module()

# myprogram.py (third way of importing)
from mymodule import func_in_module
func_in_module()

# myprogram.py (fourth way of importing, not recommended)
from mymodule import *
func_in_module()










