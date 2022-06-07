# -------------------------MEASURE TIME-------------------------
# comparing speed from two algorithms
import time

def sum1(n):
    '''
    Take an input of n and return the sum of the numbers from 0 to n
    '''
    final_sum = 0
    for x in range(n+1): 
        final_sum += x
    
    return final_sum

def sum2(n):
    """
    Take an input of n and return the sum of the numbers from 0 to n
    """
    return (n*(n+1))/2

# call1
start = time.perf_counter()
sum1(100)
end = time.perf_counter()
time1 = end-start
print(time1)

# call2
start = time.perf_counter()
sum2(100)
end = time.perf_counter()
time2 = end-start
print(time2)

# time difference
print(time1/time2)

# -------------------------BIG O NOTATION-------------------------
# Big O notation indicates who the complexity grows with the input size(n)
# Common O functions:
# 1         Constant
# log(n)    Logarithmic   (Binary Search log2 N)
# n         Linear
# nlog(n)   Log Linear
# n^2       Quadratic
# n^3       Cubic
# 2^n       Exponential












