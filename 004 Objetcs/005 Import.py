#--------------------BASIC--------------------
# Imports are always done at the top of the file
# Use only one import per line
import os
import sys
# Although it's ok to do this
from subprocess import Popen, PIPE

# Import order is: Standard libraries, Third party libraries, Local

# Always prefer importing exactly what you need
from math import pi
print(pi)

# Avoid this instead
import math
print(math.pi)

# Also avoid this
from math import *
print(pi)

#--------------------CHANGING NAMES--------------------
# example 1:
import math as m
print(m.pi)

# example 2:
from math import pi as p
print(p)


#--------------------RELATIVE IMPORTS--------------------
# File Structure
#package/
#    __init__.py
#    subpackage1/
#        __init__.py
#        moduleX.py
#        moduleY.py
#    subpackage2/
#        __init__.py
#        moduleZ.py
#    moduleA.py

# Valid imports from file moduleX.py
#from .moduleY import spam
#from .moduleY import spam as ham
#from . import moduleY
#from ..subpackage1 import moduleY
#from ..subpackage2.moduleZ import eggs
#from ..moduleA import foo
#from ...package import bar
#from ...sys import path