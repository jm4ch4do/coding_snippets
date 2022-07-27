''' ---------------------------- PYDOC --------------------------  '''
>> python -m pydoc collections.namedtuple  # docs for this package


from collections import namedtuple
print(namedtuple.__doc__)  # general docs
#or
print(help(namedtuple))  # general docs
print(dir(namedtuple))  # all available properties and methods
