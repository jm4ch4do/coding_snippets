''' -------------------------- ARRAYS ----------------------- '''
# arrays can only contain one datatype
# they can store larger amounts of data and perform operations quickly
import numpy as np
array = np.array([1, 2, 3])

# multiply each value
array * 5

# instead of
[i*5 for i in list]


''' ---------------------- INDEXING/SLICING ------------------- '''
# indexing works exactly the same as in python lists
integers = np.array([10,20,30,40,50])
integers[0] = 20  # works same as in lists
integers[1] = 21.5  # it will save 21 since it's a list of integers
integers.dtype  # shows array type

# declaring array type before assigning values
smallIntegers = np.array(integers, dtype=np.int8)
integers.nbytes  # shows memory consumption
samllIntegers.nbytes  # shows memory consumption

# ----- Slicing
arr[2:6]  # elements from 2 to 6
arr[:5] # from start to 5
arr[-3:]  # 3 last elements
arr[::2]  # every second element


''' ------------------- LIST TO ARRAY ---------------- '''
my_list = [1,2,3,4,5]
my_array = np.array(my_list)


''' ------------------- ARRAY PROPERTIES ---------------- '''
integers = np.array([[1, 2][3, 4]])
dtype(integers)  # int32
ndim(integers)  # 2
shape(integers)  # (2, 2)
size(integers)  # 4

integers.dtype  # int32


''' ------------------- TWO DIMENSIONAL ARRAYS ---------------- '''
# Vector - One Dimension, Matrix - two dimensions, Tensor - Three dimensions
matrix=np.array([
    [1,2,3,4,5],
    [6,7,8,9,10]
])

matrix[1][-1] # accesing last element
matrix.ndim  # shows array dimensions


''' ------------------- THREE DIMENSIONAL ARRAYS ---------------- '''
tensor = np.array([
    [
        [1, 2, 3],
        [4, 5, 6]
    ],
    
    [
        [7, 8, 9],
        [10, 11, 12]
    ],
    
])

tensor[1][1][2]  # getting last element