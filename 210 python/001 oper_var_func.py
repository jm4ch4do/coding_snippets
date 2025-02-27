''' ------------------------------- BASIC OPERATORS -----------------------------  '''

#! python3
# + - * / < > <= >= == != and or not
# % remainder after division
# // integer after division
# ** power
sum()
help (abs) # ayuda para abs
max (3,4) abs(-3.4) pow(2, 5)
total += i
# -= *= /= %=

''' ------------------------------------ IMPORTS --------------------------------  '''
# import always
# 1. standard library imports like 'os', 'datetime'
# 2. Third party imports
# 3. Local application imports

import mymodule # import module searching in sys.modules., built-in modules, files in the sys.path
import mymodule as new_name  # just changes the name
from mypackage import mymodule  # imports a module that belongs to a package

from random import *  # imports every module

# absolute imports (are preferable)
from package1 import module1
from package1.module2 import function1
from package2 import class1
from package2.subpackage1.module5 import function2

# relative imports
from .some_module import some_class
from ..some_package import some_function
from . import some_class

''' ------------------------------------ BASICS ---------------------------------  '''
print(random.randint(1,10)) # generate random integer
from random import *  # imports every module
randint(1,10) # now is just randint instead of random.randint

# variable inside print
cars = 100
print ("There are", cars, "cars available.")

# another way of string and scape character
'Wow, you\'re dripping wet'

# cat for string
'hello ' + 'world'

# datatypes
type(myvar)  # returns type of var
str(26) # forces the number to string
int('24') # forces the string to integer
float('3.14') # forces to float
bool('hello') # returns true because string is not empty
list('Hello') # force to list and returns ['H', 'e', 'l', 'l', 'o']
True # 1 can also be used
False # 0 can also be used
none # if function has no return

# asking information
input("give me a number")
print("Your number is ", input("give me a number"))

''' ---------------------------------- FUNCTIONS --------------------------------  '''
# defining function
def f(x='default'):
    """(number) -> number

    Return the number plus the same number

    >>> f(3)
    6
    >>> f(10)
    20
    """

    return x+x
    global y  # making reference to global y
print(f(3))

import modulo # imports file modulo
import moduloN as B # imports file moduloN and sets alias B

modulo.metodo() # executes function in file modulo
B.metodo() # executes function in file moduloN

# python searches modules in the python installation file
# or where the path variable points

import sys
print(sys.path) # shows the content of path variable (is a list)

# filter function
my_list = [1, 2, 3, 4, 5, 6, 7, 8]
def is_even(num):
    return num%2 == 0

gen = filter(is_even, my_list) # get even numbers
print(list(gen)) # gen is a generator so it must be turned into a list 

# the same with lambda or anonymous expression
# lambda expression is only used once so it requires no name
my_list = [1, 2, 3, 4, 5, 6, 7, 8]
gen = filter(lambda num:num%2 == 0,my_list)
print(list(gen))


''' ------------------------------------- IF ------------------------------------  '''
#  if statement
if a < b:
    print('a < b')
elif a > b:
    print('a > b')
else:
    print('a = b')

# empty if
if a:
    pass
else:
    statements

# in statement
print('x' in [1, 2, 3, 'x']) # returns True

''' ----------------------------------- LOOPS -----------------------------------  '''
# for statement
my_list = ['apple','banana','coco']
for i in my_list:
    print(i)

your_list = range (1,5) # creates list [1, 2, 3, 4]
for ii in your_list:
    print(ii)

for iii in range(5): # goes from 0 to 4
    print(iii)

for i in range(len(supplies)): # looping trough a list
    print(str(i)+supplies[i])

# printing each letter of a name
for letter in name:
    print(letter)

# two variables for
for record, r in zip(list, range(len(list))):
        print(letter)

# better two variables for
for r, record in enumerate(list):
        print(letter)

# find element in list
for letter in word:
    if letter == 'p':
        print('Found!')
        break
else: # if no break occurred in for
    print('Not found!')

# example enumerate
my_list = ['apple', 'banana', 'grapes', 'pear']
counter_list = list(enumerate(my_list, 1))
print(counter_list)
# Output: [(1, 'apple'), (2, 'banana'), (3, 'grapes'), (4, 'pear')]

# while statement
spam = 0
while spam < 5:
    print('Hello World')
    spam += 1
    break # remove break if you want more than one iteration
    continue # jumps to the next iteration (it never gets here)
