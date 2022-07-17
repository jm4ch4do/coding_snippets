''' -------------------- STANDARD 2D MATRIX ---------------- '''
import numpy as np
first_array = np.arange(16).reshape(4,4)
first_matrix = matrix(first_array)  # matrix object is the same as np.arry
                                    # but is restricted to two dimensions
    
    
''' -------------------- IDENTITY MATRIX ---------------- '''
second_matrix = np.matrix(np.identity(4)) # has ones only in the main diagonal
                                          # matrix creates a copy
                                          # there is a similar function mat that creates a view

    
''' -------------------- MATRIX PRODUCT ---------------- '''
# matrix product is done multiplying rows with columns
matrix_a = np.random.randint(5, size=(2,3))
matrix_b = np.random.randint(5, size=(3,2))
np.matmul(matrix_a, matrix_b)


''' --------------------- INVERT MATRIX ----------------- '''
inverse = np.linalg.inv(matrix_c)


''' -------------------- SOLVER LINEAR EQ ---------------- '''
# linear eq such as: a * x = b
a = np.mat("1 -2 1; 0 2 -8; -4 5 9")
b = np.array([ 0, 16, -18])

x = np.linalg.solve(a, b)