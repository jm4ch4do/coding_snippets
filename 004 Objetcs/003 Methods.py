#--------------------METHOD--------------------
class Circle:

    def __init__(self, radius=10):
        self.radius = radius
    
    
    def find_diameter(self):
        return self.radius * 2


my_circle = Circle(5)
print(my_circle.find_diameter())

# private methods may be defined using _
# also mangling is available using __

#--------------------METHOD CHAINING--------------------
class Pizza:
 
    def __init__(self):
        self.toppings = []
 
    def add_topping(self, topping):
        self.toppings.append(topping.lower())
        return self
 
    def display_toppings(self):
        print("This Pizza has:")
        for topping in self.toppings:
            print(topping.capitalize()) 

pizza.add_topping("mushrooms") \
    .add_topping("olives") \
    .add_topping("chicken") \
    .display_toppings()

#--------------------ID--------------------
# Every object is storing in memory, 
# everything in python is an object derived from the base class Object
# the id built-in function reveals the memory location of an object
id(my_pizza)  id(5)     id("Hello World")
a is b # only returns true when both objects share the same physical location in memory
a == b # returns true when objects have the same value(s) or content

# *** Important *** Objects from user defined classes always return False when compared to each other

# Unexpected Results:
e = "Hello, World"
f = "Hello, World"
print(e is f)  # prints True because python optimizes memory by using the same memory location

# also numbers from -5 to 256 are always optimized pointing to a predefined list so
a = 256
b = 256
a is b  # True

a = 257
b = 257
a is b  # False

# *** Important *** Lists are always passed as reference
# Objects, in general, are always passed as reference


#--------------------ALIAS--------------------
a = [1, 2, 3, 4]
b = a
# a and b are both aliases pointing to the same memory location

#--------------------CLONNING--------------------
# if you use list slicing instead you'll be cloning instead of aliasing 
b = a[:]

# for a dict you can use the copy method
my_dict.copy()


# *** Deep Copy***
# The previous is a shallow copy that makes a copy of  the container but not of the elements contained
# for example, if you shallow copy a list, any other sublist inside will still be passed as reference
# So, it's better to do a Deep Copy
import copy
a = ([5, 2, 6, 2], "Welcome")
b = copy.deepcopy(a)











