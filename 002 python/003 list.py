''' ------------------------------ DEFINING A TUPPLE ----------------------------  '''

# a tuple can't be modified after creation but doesn't expend extra memory like lists do
stock = ('GOOG', 100, 490.10) # create tuple
stock = 'GOOG', 100, 490.10 # create tuple another syntax

name, shares, price = stock # extracting values from tuples


''' ------------------------------- DEFINING A LIST -----------------------------  '''

a = [3, 10, -1]
list('Hello') # returns ['H', 'e', 'l', 'l', 'o']
range(4) # is like a list but belongs to type range
list(range(4)) # type list with [0, 1, 2, 3]
list(range(0, 100, 2)) # list starts at 0 adds two every time until it reaches 100 (not included)

#defining a list in multiple lines
spam = ['apples',
        'oranges',
        'bananas',
        'cats']

''' ----------------------------- EXTRACTING FROM LIST --------------------------  '''

a[0] # takea[1:3]s the first element of the list
a[-1] # last element in the list
a[1][1] # pos 1 of the list, and then it goes to pos 1 of the list stored there (matrix)
a[1:3] # takes the pos 1 and 2 (the list start by 0)
a[:2] # from start to the 1st element
a[1:] # from pos 1 to the end

value1, value2, value3 = a # passes the first value in the list 'a' to value1, the second to value2 and so on

'howdy' in ['hello', 'hi', 'howdy', 'heyas'] # searches 'howdy' in the list returning True
'howdy' not in ['hello', 'hi', 'howdy', 'heyas'] # returns Fal

''' ---------------------------- OPERATIONS AND METHODS -------------------------  '''

[1, 2, 3]+[4, 5, 6] # returns [1, 2, 3, 4, 5, 6]
[1, 2, 3]*3 # returns [1, 2, 3, 1, 2, 3, 1, 2, 3]

len([1,2,3]) # returns length which is 3

a.index('hello') # returns the position were the string 'hello' is. No found provokes a ValueError. Only finds the first ocurrence.

a.append('hello') # append 1 at the end of the list named a
a.insert(1,'hello') # will insert 'hello' in position 1 moving the previous value in pos 1 to pos 2
a.extend([1, 2, 3]) # will add these three in three different positions in the list

a.remove('hello') # will remove 'hello' from the list. No found provokes ValueError. Only finds the first ocurrence.
a.pop() # delete the last element (pop(0) will take the first)
del a[2] # deletes value on pos 2, pos 3 will become the new pos 2

a.sort() # sorts the list ascendently. Multiple datatypes in the list provokes TypeError
a.sort(reverse=True) # sorts the list descendently
a.sort(key=str.lower) # sort true alfabetical order. Otherwise will sort firts the Uppercase and the the lowercase
a.reverse() # reverses the elements of the list a

''' ------------------------- LISTS ARE PASSED AS REFERENCE ---------------------  '''

# how to copy a list
import copy # import this module
spam = [1, 2, 3, 4, 5] # create a list
cheese = copy.deepcopy(spam)

#example 1 of common mistake
spam = [1, 2, 3, 4, 5]
cheese = spam
cheese[1] = 'hello'
print(cheese)
# [1, 'hello', 2, 3, 4, 5]
print(spam)
# [1, 'hello', 2, 3, 4, 5]

#example 2 of common mistake
def eggs(someParameter):
	someParameter.append('hello')

spam = [1, 2, 3]
eggs(spam)
print(spam)
# [1, 2, 3, 'hello']

''' ---------------------------- OPERATIONS AND METHODS -------------------------  '''
# list comprehension
matrix = [[1, 2,3], [4, 5, 6], [7, 8, 9]]
first_col = [row[0] for row in matrix] # first_col = [1, 4, 7]

# build deck of cards
SUITE = 'H D S C'.split()
RANKS = '2 3 4 5 6 7 8 9 10 J Q K A'.split()
all_cards = [(s, r) for s in SUITE for r in RANKS]

''' ------------------------------------- SET -----------------------------------  '''
x = set()
x.add(1)
x.add(2)
x.add(4) # returns x = {1, 2, 4}
x.add(4)
x.add(4) # still x = {1, 2, 3} because it's a collection of unique unordered elements

x = set([1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3]) # returns x = {1, 2, 3}


''' ---------------------------- SORTING LIST OF TUPLES --------------------------  '''
# sorting by field0
final_list.sort(key=lambda x: (x[0]))
# sorting by field0 (another way)
from operator import itemgetter
final_list.sort(key=itemgetter(0))

# sorting by field1 then field 0 both reverse
final_list.sort(key=lambda x: (x[1], x[0]), reverse=True)

# ------ complex sort -----
# sorting by field1(reverse), field2(list_based) and field0
# input
my_list = [('x', 2, '=:'), ('h', 2, '=:'),('e', 5, '2:'), ('t', 2, '1:'), ('r', 2, '2:'), ('a', 6, '=:'), ('f', 5, '=:')]

def my_sort(x):  # user_sort_function
    comp1 = -x[1]  # field1 inverse

    ref_list = ['1:', '2:', '=:']  # reference list for sorting field2
    comp2 = [i for i, value in enumerate(ref_list) if x[2] == value]
    comp2 = comp2[0]
    
    comp3 = x[0] # field0 regular
    return comp1, comp2, comp3
      
my_list.sort(key=my_sort)

# result
my_list = [('a', 6, '=:'), ('e', 5, '2:'), ('f', 5, '=:'), ('t', 2, '1:'), ('r', 2, '2:'), ('h', 2, '=:'), ('x', 2, '=:')]


