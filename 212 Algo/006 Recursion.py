 # Recursion problems can be often reduced to find the base function
 # and call over and over the same function until you hit the base function

# classic fibonacci example
fib_cache = {}

def fibo(n):

    # base condition
    if n in (0,1):
        return 1

    # memoization check
    if n in fib_cache:
        return fib_cache[n]

    # recursive call
    value = fibo(n-1) + fibo(n-2)

    # cache result
    fib_cache[n] = value
    return value

# not recursive
def sum_func(nums):

    # abort if no nums
    if not nums:
        return None

    # just one character -> return character
    if len(str(nums)) == 1:
        return nums

    # loop vars
    total = 0

    # sum every num
    while nums:
        far_right = nums % 10
        nums = int(nums/10)

        total += far_right

    # return total
    return total

# recursive
def sum_func(nums):

    # abort if no nums
    if not nums:
        return None

    # just one character -> return character
    if len(str(nums)) == 1:
        return nums

    # sum and call func again
    far_right = nums % 10
    nums = int(nums/10)
    return far_right + sum_func(nums)

