Sequential complexity is O(n)
Binary sort complexity is O(logn) 

#--------------------SEARCH--------------------
# Sequential Search
# in is used in python for searching
4 in [3,5,2,4,1]  # returns True

#-----SEQUENTIAL SEARCH-----
# review every element sequentially until you find the target

# example for unordered array
def seq_search(arr, ele):

    pos = 0
    found = False

    while pos < len(arr) and not found:

        if arr[pos] == ele:
            found = True

        else:
            pos += 1

    return found

# example for ordered array
def seq_search(arr, ele):

    pos = 0
    found = False
    stopped = False

    while pos < len(arr) and not found and not stopped:

        if arr[pos] == ele:
            found = True

        elif arr[pos] > ele:
            stopped = True

        else:
            pos += 1

    return found

# binary search for ordered array (example of divide and conquer)
# binary search is O(log2 N)

# binary search implementation 1 (iterative)
def binary_search(arr, ele):

    first = 0
    last = len(arr) - 1

    found = False

    while first <= last and not found:

        mid = int((first + last) / 2)

        if arr[mid] == ele:
            found = True

        else:
            if ele < arr[mid]:
                last = mid - 1
            else:
                first = mid + 1

    return found


# binary search implementation 2 (recursively)
def rec_bin_search(arr, ele):

    if len(arr) == 0:
        return False

    else:

        mid = len(arr)/2

        if arr[mid] == ele:
            return True

        else:

            if ele < arr[mid]:
                return rec_bin_search(arr[:mid], ele)

            else:
                return rec_bin_search(arr[mid+1:], ele )




# quicksort and mergesort are the most popular algorithm (mainly quicksort)
# their complexity is O(log n) 


# THE FASTER WAY TO SEARCH IS USING HASH TABLES (DICTIONARIES) WHO'S COMPLEXITY IS O(1)























