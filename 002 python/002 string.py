''' ----------------------------- DEFINING A STRING -----------------------------  '''

a = 'jose'
len(a) # longitud de Jose

# string in multiple lines using the continuation character (\)
print('this is a really really long long ' + \
'string but is ok you can use several lines for it')

''' ----------------------- GETTING DATA FROM THE STRING ------------------------  '''

a[0] # takes the first letter
a[1:3] # # takes the pos 1 and 2 (the string start by 0)
a[:] # the whole string
a[::] # the whole string also (: all the way from the beginning and : all the way to the end)
a[::2] # take all the string with step of two (take one letter and skip the order)
# it works the same as a list
a.split() # returns a list with a word in each position
a.split('e') # uses e as separator (default is ' ')
a.split()[:2] # dos primeras palabras del string


''' ---------------------------- MODIFYING STRINGS ------------------------------  '''

# changing 'jose a great' to 'jose the great'
name = 'jose a great'
newName = name[0:5] + 'the' + name[6:11]

a.islower() # returns True if string is lowercase
a.isalpha() # letters only
a.isalnum() # letters and numbers only
a.isdecimal() # numbers only
a.isspace()   # whitespace only (also \n \t)
a.istitle()   # titlecase only

'Hello'.startswith('Hel') # returns true
'Hello'.endswith('lo') # returns true

', '.join(['cats', 'rats', 'bats']) # returns 'cats, rats, bats'
'My name is Simon'.split() # returns ['My', 'name', 'is', 'Simon']
'My name is Simon'.split(' ') # returns ['My', 'name', 'is', 'Simon']
                              # the same but specifies ' ' as separator


a.replace('e','EE') # replaces every 'e' by 'EE'

''' ---------------------------- ESCAPE CHARACTERS ------------------------------  '''

\' # single quote
\" # Double quote
\n # Newline (line break)
\\ # Backslash

''' ---------------------------- FORMATTING STRINGS -----------------------------  '''

a.lower() # string to lowercase
a.upper() # string to uppercase

'Hello'.rjust(10) # returns 'Hello' with spaces at the start to complete 10 characters
                  # '     Hello'
'Hello'.ljust(10) # 'Hello     '
'Hello'.ljust(10, '*') # 'Hello*****'
'Hello'.center(11) # '   Hello   '

a.strip() # removes whitespaces from the begining and the end of the string
a.lstrip() # left strip
a.rstrip() # right strip

name = 'Alice'
place = 'Main Street'
time = '6 pm'
food = 'turnips'
'Hello %s, you are invited to a party at %s at %s. Please bring %s' % (name, place, time, food )
