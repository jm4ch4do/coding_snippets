#--------------------INHERITANCE--------------------
class Polygon:
    
    def __init__(self, num_sides, color):
        self.num_sides = num_sides
        self.color = color


class Triangle(Polygon):
    
    NUM_SIDES = 3

    def __init__(self, base, height, color):
        Polygon.__init__(self, Triangle.NUM_SIDES, color)  # initializes parent
        super().__init__(Triangle.NUM_SIDES, color)  # is the same to use super()
        self.base = base
        self.height = height


my_triangle = Triangle(5, 4, "Blue")

# *** Useful ***
print(dir(my_triangle))  # displays all attributes
issubclass(Polygon, Triangle)  # check if is parent


#--------------------MULTILEVEL INHERITANCE--------------------
class Vehicle:
	pass
 
class LandVehicle(Vehicle):
	pass
 
class Car(LandVehicle):
	pass
 
class Truck(LandVehicle):
	pass


#--------------------MULTIPLE INHERITANCE--------------------
class Rectangle:
 
    def __init__(self, length, width, color):
        self.length = length
        self.width = width
        self.color = color
 
class GUIElement:
 
    def click(self):
        print("The object was clicked...")
 
class Button(Rectangle, GUIElement):
 
    def __init__(self, length, width, color, text):
        Rectangle.__init__(self, length, width, color)
        self.text = text


#--------------------METHOD INHERITANCE--------------------
class Polygon:

    def __init__(self, num_sides, color):
        self.num_sides = num_sides
        self.color = color

    def describe_polygon(self):
        print(f"This polygon has {self.num_sides} sides and it's {self.color}")


class Triangle(Polygon):
    NUM_SIDES = 3

    def __init__(self, base, height, color):
        super().__init__(Triangle.NUM_SIDES, color)
        self.base = base
        self.height = height


class Square(Polygon):
    NUM_SIDES = 4

    def __init__(self, side_lenght, color):
        super().__init__(Square.NUM_SIDES, color)
        self.side_lenght = side_length


# child objects are able to call the parent class method
my_triangle = Triangle(5, 4, "Blue")
my_triangle.describe_polygon()

my_square = Square(4, "Green")
my_square.describe_polygon()


#--------------------METHOD FROM PARENT CLASS--------------------
class Triangle:
 
	def __init__(self, base, height):
		self.base = base
		self.height = height
	
	def find_area(self):
		print((self.base * self.height)/2)
 
		
class RightTriangle(Triangle):
	
	def display_area(self):
		print("=== Right Triangle Area ===")
 
                # This line calls the method from the Triangle class
		Triangle.find_area(self) # You could also use super().find_area()

#--------------------METHOD OVERRIDING--------------------
class Teacher:

    def __init__(self, full_name, teacher_id):
        self.full_name = full_name
        self.teacher_id = teacher_id

    def welcome_students(self):
        print(f"Welcome to class! I'm your teacher. My name is {self.full_name}")

class ScienceTeacher(Teacher):

    def welcome_student(self):  # overrriding the parent function
        print("Science is amazing.")
        super().welcome_students()  # if you need to use the parent function this is the way 
        

#--------------------METHOD OVERLOADING--------------------
# In Java two methods can have the same name and different parameters
# Python, does not support method overloading,
# The closes thing to that is default parameters

#--------------------POLYMORPHISM--------------------
# Polymorphism means an object can take many forms
# it includes overriding and overloading