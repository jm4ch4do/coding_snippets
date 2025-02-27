# --------------- FOR LOOPS
# for elements
my_list = ['apple','banana','coco']
for fruit in my_list:
    print(i)

# for 0, 1, 2, 3
for f in range(len(my_list)):
    print(i)

# for string
for letter in name:
    print(letter)

# two variables for
for record, r in zip(list, range(len(list))):
        print(letter)

# for index and item
for r, record in enumerate(list):
        print(letter)

# find element in list
for letter in word:
    if letter == 'p':
        print('Found!')
        break
else: # if no break occurred in for
    print('Not found!')

# --------------- LIST COMPREHENSION
l = [my_function(record) for record in my_list] # applies my_function to every element and stores ouput in array
print(l)

l = [my_function(record) for record in my_list if p>= threshold] # only applies function to longer matching condition

# prettier version
l = [
    my_function(record)
    for record in long_list
    if p>= threshold
]

# example 3: print matrix with double for
l = [print(my_list[x][y]]) for x in range(len(my_list)) for y in range(len(my_list[0]))]

# --------------- MAP and FILTER
m = map(my_function, my_list) # example 1
print(list(m))

# example 2
def is_greater(p):
    return p >= threshold

m = map(my_function, filter(is_greater, my_list)) # example 2
print(list(m))

# prettier
m = map(
    my_function,
    filter(
        is_greater,
        my_list
    )
)
print(list(m))

# --------------- USING ITERTOOLS
import itertools # library with loop functions
