''' ------------------- APPEND ---------------- '''
# append adds the value to the end of the array
np.append([[10, 20, 30], 40]) # [10, 20, 30, 40]


''' ------------------- INSERT ---------------- '''
# insert allows indicating where you want to insert
np.insert([10, 20, 30, 50], 3, 40) # [10, 20, 30, 40, 50]


''' ------------------- DELETE ---------------- '''
# you can specify which position to delete
np.delete([10, 20, 30, 40, 50], 4)  # [10, 20, 30, 40]


''' ------------------- SORT ---------------- '''
ints = np.random.randint(0,20,50) # 50 random integers from 0 to 20
ints_sorted = np.sort(ints)  # 50 sorted integers

# when sorting bidimensional arrays it will sort each of the internal arrays


''' ------------------- COPY/VIEW ---------------- '''
# arrays are copied by reference same as list
# you can say the new array is a different view of the same original array
# to make an independent duplicate of an array use the copy() function
new_array = array.copy()
id(new_array)


''' ------------------- RESHAPE ---------------- '''
# transform multidimensional into unidimensional or viceversa
OneD = np.arange(1, 13)  # [1, 2, 3 ..., 12]
ThreeD = np.reshape(OneD, (3, 4))  # arrange in three vectors of 4 values each
                                   # [1,  2,  3,  4],
                                   # [5,  6,  7,  8],
                                   # [9, 10, 11, 12]
ThreeD = np.reshape(OneD, (3, 2, 2))  # three dimensional array of 3x2x2


# convert from 2 dimensions to 1 dimension (flattening)
arr = np.array([ [1, 2], [3, 4], [5, 6]])
np.reshape(arr, -1)  # [1, 2, 3, 4, 5, 6]

# you can also use flatten or ravel
arr = [[1,2], [3,4]]
new_arr = arr.flatten()  # creates a new copy
same_arr = arr.ravel()   # creates a new view


''' ------------------- CONCAT ---------------- '''
arr1, arr2 = np.arange(1, 6), np.arange(6, 11)
arr3 = np.concatenate(arr1, arr2)  # [1,2,3,4,5,6,7,8,9,10]

# when joining two dimensional arrays you must specify join rows or columns
arr3 = np.concatenate(arr1, arr2, axis=1)  # join rows 

# you can also use stack() but it only concatenates columns
arr3 = np.stack(arr1, arr2)

# you can also specify horizontal stacking or vertical stacking
arr3 = np.hstack(arr1, arr2)
arr3 = np.vstack(arr1, arr2)


''' ------------------- SPLIT ---------------- '''
arr2 = np.array_split(arr, 4)  # divides into 4 subarrays of equal dimensions

# you also have vertical and horizontal split
arr2 = np.vsplit(arr, 4)
arr2 = np.hsplit(arr, 4)




