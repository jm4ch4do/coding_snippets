''' ------------------- GENERATE INTEGERS ---------------- '''
# arange in numpy is similar as range in Python
integers_array=np.arange(10)  # array([0,1,2,3,4,5,6,7,8,9])
integers_array=np.arange(10,13)  # array([10,11,12])
integers_array=np.arange(10,20,2)  # array([10,12,14,16,18])


''' ------------------- GENERATE DECIMALS ---------------- '''
# linspace is used for generating decimal point values
np.linspace(10,20) # returns 50 equally spaced samples
np.linspace(10,20,4) # [10., 12.5, 17.5, 20.]


''' ------------------- GENERATE RANDOM ---------------- '''
np.random.rand(10)  # random float
np.random.randint(0,100,20)  # 20 random integers from 0 to 100


''' ------------------- GENERATE ZEROS/ONES ---------------- '''
np.zeros(5)  # five 0s with type float
np.zeros((4,5))  # 4x5 matrix of 0s also type float
np.zeros((4,5), dtype=int)  # now it uses integers

np.