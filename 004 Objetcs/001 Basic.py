#--------------------OOP--------------------
# Object Oriented Programming (OOP) is a paradigm (approach, way, style)
# used to solve problems with code
# Other paradigms are Imperative Programming, Function P, Declarative P or Logic P
# Imperative: write lines in the command line. It's very common when we start learning
# Paradigmes are not mutually exclusive, they can be combined in a program


#--------------------ADVANTAGES OOP--------------------
# Modularity:     You may have many independent class that you can change
#                 without affecting the others. They may have different tasks to perform.
# Extensibitlity: You may extend classes to include new features preserving some of 
#                 the previous ones
# Reusability:    You can create many objects and reuse code.

# Overall: Code is easier to maintain.

# PEP (Python Enhancement Proposal): Document providing info or describing new features.
# PEP 8: Defines the official style conventions


#--------------------CLASS DEFINITION--------------------
# Python 3
class Backpack:
    pass

# Python2, you can also used it in Python3 to make it compatible
class Backpack(object):
    pass

#--------------------CLASS BODY--------------------
# class definition
class Backpack:
    
    # Class Attributes (common for all objects)
    material = "cotton"
    max_num_items = 10

    # Constructor: Method called automatically when Object is created
    #              Used to initialize instance attributes
    def __init__(self, color, size, price=10):
        self.price = price
        self.items = ["Water Bottle", "Pencils"]
        self.color = color
        self.size = size


# Object creation
my_backpack = Backpack("Blue", 5)
my_backpack.color = "Dark Blue"

# Access Class Attributes
Backpack.max_num_items = 15  
my_backpack.max_num_items = 20  # class attributes can also be accessed 
                                # via objects althought is not a common practice
                                