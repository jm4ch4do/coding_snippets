#--------------------SPECIAL METHODS--------------------
5 + 6 
# is really executed like this behind the scenes
(5).__add__(6)

# operator overloading is implemented inside python, for example
# the + sign means different thing for strings, integers and list


# ___str___ Returns when printing or str() an object
# you can also use __repr() which is a more detail representation used for debuging
class Student:

    def __init__(self, student_id, name, age, gpa):
        self.student_id = student_id
        self.name = name
        self.age = age
        self.gpa = gpa

    def __str__(self):
        return f"Student: {self.name} " \
               f"| Student ID: {self.student_id} " \
               f"| Age: {self.age} " \
               f"| GPA: {selg.gpa}"


student = Student("42AB9", "Nora Nav", 34, 3.76)
print(student)


# ___len___ Returns when printing or str() an object
class Backpack:

    def __init__(self):
        self.items = []

    def add_item(self, item):
        self.items.append(item)

    def remove_item(self, item):
        if item in self.items:
            self.items.remove(item)
        else:
            print("This item is not in the backpack")

    def __len__(self):
        return len(self.items)


my_backpack = Backpack()

my_backpack.add_item("Water Bottle")
my_backpack.add_item("First Aid Kit")
my_backpack.add_item("Sleeping Bag")

print(len(my_backpack))



# *** Others ***
# __get_item__() called to implement evaluation i.e. self[key]

# __bool__() when used in boolean context i.e. bool(object) or object is True
# if not defined __len__ will be used instead being True if len = 0

# *** Comparison Operators ***
# __lt__()
# __le__()
# __eq__()
# __ne__()
# __gt__()
# __ge__()




