# TIME COMPLEXITY FOR SORTING ALGORITHMS
#                 Average      Worst    Best
# Bubble           O(n^2)     O(n^2)    O(n^2)     
# Selection        O(n^2)     O(n^2)    O(n^2)
# Insertion        O(n^2)     O(n^2)    O(n) when nearly sorted
# Shell           O(n^3/2)    O(n^3/2)  O(nlogn)  when nearly sorted
# Quick Sort      O(nlogn)    O(n^2)    O(nlogn)
# Merge           O(nlogn)    O(nlogn)  O(nlogn)

# SPACE COMPLEXITY FOR SORTING ALGORITHMS
#                 Worst   Best  
# Bubble           O(1)        
# Selection        O(1)    
# Insertion        O(1)    
# Quick Sort       O(n)   O(logn)
# Merge            O(n)  


# Being the two last the most used, mostly quicksort
# all sorting algorithm can be found at: www.sorting-algorithms.com
# together with visual representations
# also at visualgo.net/sorting.html

# Bubble
# reviews the list several time sorting every element with the next
# it's like using sorting in small bubbles.
def bubble_sort(arr):
    
    for n in range(len(arr)-1,0,-1):
        for k in range(n):

            if arr[k] > arr[k+1]:
                temp = arr[k]
                arr[k] = arr[k+1]
                arr[k+1] = temp


# Selection O(n-1)^2
# Instead of changing every value, it looks only for the largest (or smaller) item in
# the first pass on the list, then the second largest in the second pass and so on.
def selection_sort(arr):

    for fillslot in range(len(arr)-1, 0, -1):

        positionOfMax = 0

        for location in range(1, fillslot + 1):
            if arr[location] > arr[positionOfMax]:
                positionOfMax = location

        temp = arr[fillslot]
        arr[fillslot] = arr[positionOfMax]
        arr[positionOfMax] = temp

# Insertion 
# (take every element and insert it in the position it should go)
# (it's similar to how you will do it by hand)
def insertion_sort(arr):

    for i in range(1, len(arr)):

        currentvalue = arr[i]
        position = i

        while position > 0 and arr[position-1] > currentvalue:

            arr[position] = arr[position - 1]
            position = position - 1

        arr[position] = currentvalue

# Shell 
# Is similar to Insertion but first breaks the list into smaller sublist first
# The way the sublist are chosen is the key to shell sort
# it uses increments to sort elements separated by n elements, so it moves elements
# faster because in every sort elements get closer to their final position compared to Insertion
def shell_sort(arr):

    sublistcount = len(arr)/2

    while sublistcount > 0:
        for start in range(sublistcount):

            gap_insertion_sort(arr, start, sublistcount)

        sublistcount = sublistcount/2

def gap_insertion_sort(arr, start, gap):

    for i in range(start + gap, len(arr), gap):

        currentvalue = arr[i]
        position = i

        while position >= gap and arr[position-gap] > currentvalue:

            arr[position] = arr[position-gap]

        arr[position] = currentvalue

# Merge Sort
# Is a recursive divide and conquer algorithm that continuosly splits a list in half
# It keeps spliting until you have a side two list. Then it sorts the smaller lists
# and merges them which means it sorts again after joining the two smaller sorted lists

def merge_sort(arr):

    if len(arr) > 1:

        mid = len(arr)/2
        lefthalf = arr[:mid]
        righthalf = arr[mid:]

        merge_sort(lefthalf)
        merge_sort(righthalf)

        i = 0
        j = 0
        k = 0

        while i < len(lefthalf) and j < len(righthalf):

            if lefthalf[i] < righthalf[j]:
                arr[k] = lefthalf[i]

                i += 1

            else:
                arr[k] = righthalf[j]
                j += 1

            k += 1

        while i < len(lefthalf):
            arr[k] = lefthalf[i]
            i += 1
            k += 1

        while j < len(righthalf):
            arr[k] = righthalf[j]
            j += 1
            k += 1


# Quick Sort
# Also uses divide and conquer in a similar way
# chooses a pivot value and then compares all other elements with that pivot
# it moves two pointer one from start to end and the other from end to start
# once it finds a smaller and a greater element, it swaps the elements
# when both pointers touch, that's where you place the pivot value.

def quick_sort(arr):

    quick_sort_help(arr, 0, len(arr) - 1)

def quick_sort_help(arr, first, last):
    
    if first < last:

        splitpoint = partition(arr, first, last)

        quick_sort_help(arr, first, splitpoint - 1)
        quick_sort_help(arr, splitpoint + 1, last)

def partition(arr, first, last):
    
    pivotvalue = arr[first]

    leftmark = first + 1
    rightmark = last

    done = False

    while not done:

        while leftmark <= rightmark and arr[leftmark] <= pivotvalue:

            leftmark += 1

        while arr[rightmark] >= pivotvalue and rightmark >= leftmark:

            rightmark -= 1

        if rightmark > leftmark:
            done = True

        else:
            temp = arr[leftmark]
            arr[leftmark] = arr[rightmark]
            arr[rightmark] = temp

    temp = arr[first]
    arr[first] = arr[rightmark]
    arr[rightmark] = temp

    return rightmark