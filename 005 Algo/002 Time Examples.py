# -------------------------CONSTANT O(1)-------------------------
# Is constant O(1) because it will always output 1 value no matter
# the size of the input
def func_constant(values):
    print(values[0])

lst = [1,2,3,4,5,6,7,8,9,10]
print(func_constant(lst))


# -------------------------LINEAR O(n)-------------------------
# O(n) for every input you'll get 1 output
def func_lin(lst):
    for val in lst:
        print(val)

func_lin(lst)


# -------------------------LINEAR O(n^2)-------------------------
# O(n^2) n times n or n^2
def func_quad(lst):
    for item_1 in lst:
        for item_2 in lst:
            print(item_1, item_2)

























