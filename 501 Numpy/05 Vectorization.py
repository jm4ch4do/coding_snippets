''' ------------------- VECTORIZATION ---------------- '''
# numpy supports operations done to every element of the array
# to avoid unnecessary for loops

a = [2, 3, 4, 5]
b = [1, 2, 3, 4]

a + b # [3, 5, 7, 9]
a - b # [1, 1, 1, 1]
a * b
b / a
a ** c  # [a ^ b]


# the same operations are also available as functions
np.add(a, b)
np.subtract(a, b)
np.multiply(a, b)
np.divide(a, b)

# remainder of division
np.mod(a, b)
np.power(a, b)  # exponenciation
np.sqrt(a, b)