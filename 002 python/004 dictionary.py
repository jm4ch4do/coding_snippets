''' ---------------------------- DEFINING A DICTIONARY --------------------------  '''

myCat = {'size': 'fat', 'color': 'gray', 'disposition': 'loud'}
myCat['size'] # returns 'fat'
myCat['tail'] = 'black' # introducing new items and values

# two dictionaries are equal even when the are not equally sorted
myCat = {'size': 'fat', 'color': 'gray', 'disposition': 'loud'}
myDog = {'disposition': 'loud', 'size': 'fat', 'color': 'gray' }
myCat == myDog # returns true

# pretty dictionary
ages = {
    'Mary'      : 31,
    'Jonathan'  : 28
}

myCat['age'] # reference to an unexisting key returns KeyError
age = ages.get('Dick', 'Unknown') # asking for keys the right way (returns Unknown if key does not exist)

'size' in eggs # returns True because key 'size' is in myCat
'size' not in eggs # returns False

# dictonaries to list
list(myCat.keys()) # ['size', 'color', 'disposition']
list(myCat.values()) # ['fat', 'gray', 'loud']
list(myCat.items()) # [('size', 'fat'), ('color', 'gray'), ('disposition', 'loud')]

# print dictionary with double for
for k, v in myCat.items():
    print(k,v)

# size fat
# color gray
# disposition loud

# get key without errors
myCat.get('name','') # returns the name value if it exists, otherwise returns and empty string

myCat.setdefault('color', 'white') # if is not set, color will default to white

# code to count the occurrences of each letter in a string

import pprint # just for a prettier print

# use ''' to scape any ' or " in the text
message = '''It was a bright cold day in April, and the clocks were striking thirteen'''
count = {} # creates the dictionary

for character in message.upper(): # loop through the string turning every letter in Uppercase
    count.setdefault(character, 0) # if the key doesn't exist, initialize it in 0
    count[character] += 1

pprint.pprint(count) # same as print but prettier


# an array of a dictionary is a data structure
cat = {'name': 'Zophie', 'age': 7, 'color': 'gray'}
allCats = []
allCats.append({'name': 'Zophie', 'age': 7, 'color': 'gray'})
allCats.append({'name': 'Pooka', 'age': 5, 'color': 'black'})
allCats.append({'name': 'Fat-tail', 'age': 5, 'color': 'orange'})

