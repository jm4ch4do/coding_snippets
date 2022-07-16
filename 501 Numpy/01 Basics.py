''' -------------------------- NUMPY ----------------------- '''
# Python List:
#    - No support for vectorized operations
#    - No fixed type elements
#    - For loops are not efficient (datatype is checked in each iteration)

# Numpy Arrays:
#   - Same tasks with fewer lines
#   - Fewer loops
#   - Advanced mathematical functions
#   - Machine learning packages uses Numpy
#   - is open source

# Common way of importing numpy
import numpy as np


''' -------------------------- ARRAYS ----------------------- '''
# arrays can only contain one datatype and cannot be extended once created
# they can store larger amounts of data and perform operations quickly
import numpy as np
array = np.array([1, 2, 3])

# multiply each value
array * 5

# instead of
[i*5 for i in list]