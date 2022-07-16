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
