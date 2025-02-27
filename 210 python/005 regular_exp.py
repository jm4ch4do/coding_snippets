# https://docs.python.org/2/library/re.html

import re # import regular expressions module

''' ------------------------------ CHARACTER CLASSES ----------------------------  '''
\d # numeric digit
\D # not numeric digit
\w # word, digit or underscore
\W # not
\s # space, tab or newline
\S #
'\w+' # one ore more of \w same for the rest
'\w*' # zero or more


''' ----------------------------- OPTIONAL AND GROUPS ---------------------------  '''

# looking for anything starting with Batman, Batmobile, Batcopter or Batbat
# use the pipe character |
batRegex = re.compile(r'Bat(man|mobile|copter|bat)')
mo = batRegex.search('Batmobile lost a wheel')
mo.group() # returns 'Batmobile'
mo.group(1) # returns 'mobile'

# use ? for a piece of string that may not appear or appear once
batRegex = re.compile(r'Bat(wo)?man')
mo = batRegex.search('The Adventures of Batman')
mo.group() # returns Batman
mo2 = batRegex.search('The Adventures of Batwoman')
mo.group() # returns Batwoman

''' ------------------------------ SEARCHING PHONES -----------------------------  '''

message = 'Call me 415-555-1011 tomorow, or at 415-555-9990 to my office line'

# to search for phone numbers in this string we create a regular expression object
regEx = re.compite(r'\d\d\d-\d\d\d-\d\d\d\d') # (r = raw string)object of datatype regular expression that will search for the pattern were \d is a digit
mo = regEx.search(message) # returns a match object
print(mo.group()) # will print the first telephone  number

# using ( ) we can set groups
regEx = re.compite(r'(\d\d\d)-(\d\d\d-\d\d\d\d)')
mo = regEx.search(message)
print(mo.group()) # prints the whole number
print(mo.group(1)) # prints first group 415
print(mo.group(2)) # prints second group 555-1011

# if you use \( it means your are actually looking for a parhentesis
regEx = re.compite(r'\(\d\d\d')-(\d\d\d-\d\d\d\d)')

# to get a list all telephone numbers
message = 'Call me 415-555-1011 tomorow, or at 415-555-9990 to my office line'
regEx = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')
print( regEx.findall(message)) # list with phones

# if there are 2 or more groups the list will return tupples
regEx = re.compile(r'(\d\d\d)-(\d\d\d-\d\d\d\d)')
print( regEx.findall(message)) # returns [('508', '555-555'), ('508', '555-1234')]


''' ---------------------------- USER DEFINED CLASSES ---------------------------  '''

# ----- user defined charater classes
vowelRegex = re.compile(r'[aeiou]') # class with vowels (only works with lowercase vowels otherwise use aeiouAEIOU)
# this will get the same results as  using the pipe
vowelRegex = re.compile(r'(a|e|i|o|u)')

# if you want all lowercase letters
vowelRegex = re.compile(r'[a-z]')

# any ocurrence of 2 lowercase letters
vowelRegex = re.compile(r'[a-z]{2}')

# anything but vowels using negative match ^
vowelRegex = re.compile(r'[^aeiou]')

''' ------------------------------ SPECIAL CLASSES ------------------------------  '''

# ----- start or end of string
beginsWithHellowRegex = re.compile(r'^Hello') # only matches if Hello is at the start of the string
endsWithWorldRegex = re.compile(r'world$') # only matches if world is at the end of the string
allDigitsRegex = re.compile(r'^\d+$') # (match only if all characters are digits) when using ^ and $ at the same time, the match will occur only if the pattern appears at the start and the end of the string


# ----- all characters
atRegex = re.compile(r'.at') # any character followed by 'at' (bat, cat, fat)
atRegex = re.compile(r'.{1,2}at') # one or two characters (with exception of newline) followed by 'at'

.* # means any character zero or more times
nameRegex = re.compile(r'First Name: (.*) Last Name: (.*)')
nameRegex.findall('First Name: Al Last Name: Sweigart') # returns [('Al','Sweigart')]

# greddy vs nongreedy
serve = '<To serve humans> for dinner.>'

nongreedy = re.compile(r'<(.*?)>') # take everything between < >
                                   # returns To serve humans

greedy = re.compile(r'<.*>') # tries to take as much as it can by using the second > instead of the first
                             # returns To serve humans> for dinner.

# get the newline character too
dotStar = re.compile(r'.*', re.DOTALL)

# ignore Case
dotStar = re.compile(r'.*', re.I) # both do the same
dotStar = re.compile(r'.*', re.IGNORECASE) # both do the same


''' ------------------------------ FIND AND REPLACE -----------------------------  '''

namesRegex = re.compile(r'Agent \w+') # match Agent and word letter until find not word character
namesRegex.findall('Agent Alice gave the secret documents to agent Bob.')
# returns ['Agent Alice', 'Agent Bob']
namesRegex.sub('HIDDEN','Agent Alice gave the secret documents to agent Bob.')
# returns 'HIDDEN gave the secret documents to HIDDEN'

namesRegex = re.compile(r'Agent (\w)\w*')
namesRegex.findall('Agent Alice gave the secret documents to agent Bob.')
# returns the first letter of each name ['A', 'B']

namesRegex.sub('rAgent \1****', 'Agent Alice gave the secret documents to agent Bob.')
                      #\1 stands for the group n. 1 in the match
# returns 'Agent A**** gave the secret document to Agent B****'

''' -------------------------------- GOOD SYNTAX --------------------------------  '''

# easy to read syntax in verbose mode which allows to use multiples lines
re.compile(r'''
\d\d\d  # three digits (you can add comments with no problem)
-       # a slash
\d\d\d  # three more digits
-
\d\d\d\d # last 4 digits of the phone
\sx\d{2,4} # extension number
''', re.VERBOSE | re.I | re.DOTALL) # this is the way to combine several re.


''' ---------------------------- VALIDADATE PASSWORD ----------------------------  '''
# use search(list1, string2): verifies if at least one character from list1 is in string2
from re import search
password = "R@m@_f0rtu9e$"

# 
if (len(p)< 6 or len(p)>12):  # password length
  return False

if not search("[a-z]", password)  # should contain a lowercase
  return False

if not search("[0-9]", password)  # should contain a number
  return False

if not search("[A-Z]", password)  # should contain an uppercase
  return False

if not search("[$#@]", password)  # should contain an strange character
  return False

# no problem -> return True
return True



# ---------- One regex version ----------

# every group will be evaluated from the start of the string
a = "\A"    

# group 1: string has more than 6 characters and less than 10(alphanumeric)
b = "(?=\w{6, 10})"  # () group, ?= lookahead assertion meaning that previous match works only if this match works(is True)  
                     # \w any word or character, {6, 10} lenght from 6 to 10

# group 2: string has at least one lowercase
c = "(?=[^a-z]*[a-z])"  # () group, ?= same
                        # [^a-z]*[a-z] accept zero o more repetitions of something that is not a lowercase
                        #              until you find a lowercase

# group 3: string has at least one uppercase
d = "(?=[^A-Z]*[A-Z])"  # () group, ?= same
                        # [^A-Z]*[A-Z] same as before for uppercase

# group 4: string has at least one string
e = "(?=\D*\d)"  # () group, ?= same
                 # \D*\d accept zero o more repetitions of something that is not a digit
                 # until you find a digit

# group 5: string has only alphanumeric characters
f = "(?!\w*[\W|_]+)"  # () group, ?! negative lookahead assertion meaning that previous match works only if this match is False  
                      # \w* accept any zero or more repetitions of words(alphanumeric characters)
                      # [\W|_] until you find one or more of not-words or one or more of '_'(the _ is considered a word)

# put together all the groups
regex = a + b + c + d + e + f



"[^a-z]"  # anything but lowercases
"(^/w+$)"
