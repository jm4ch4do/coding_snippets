''' ------------------- AGGREGATE ---------------- '''
# Aggregate function operate on the whole array an return an scalar
# two clear examples are the sum() or the avg() functions

arr = np.array([[10, 20, 30, 40, 50], [60, 70, 80, 90, 100]])

arr.sum()  # 550 because is summing every cell
arr.sum(axis=0)  # sum every col [150, 400]
arr.sum(axis=1)  # sum every row [70, 90, 110, 130, 150]

# all of these functions also have the axis parameter
arr.prod()  # product of all elements in array
arr.average()
arr.min()
arr.max()
arr.mean()
arr.std()


''' ------------------- SEARCH ---------------- '''
np.unique(arr)  # get unique elements in all dimensions
np.unique(arr, axis=0)  # get unique rows
np.unique(arr, axis=1)  # get unique cols
np.unique(arr, return_index=True)  # return unique elements and their index
np.unique(second_arr, return_counts=True) # frequency count of unique elements


''' ------------------- REVERSE ---------------- '''
# traspose changes rows into columns and viceversa
np.transpose(arr)

# reverse 1D array
arr[::-1]








