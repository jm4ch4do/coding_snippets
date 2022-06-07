def find_all_twice_linear(_n):
  	"""
    Finds all values until _n

    :notes:
        You need to go one more list than necessary because numbers from latter lists may belong to previous list
        for example
        [1], [3, 4], [7, 9, 10, 13], [15, 19, 21, 22, 27, 28, 31, 40], [39, ...] where 39 goes in previous
        so you save 39 in put_in_previous and adding before 40
        also if you are looking for _n = 10 which is 22 you still need to complete the whole list from 15-40
        because a number in goes in previous may be before 22 which will change the answer
        safe_numbers is used to make sure the list which have the number in it, had included already put_in_previous
    """
    
    # initial conditions first list is [1] which produces [3, 4] and so on...
    next_numbers = [3, 4]
    collection = [[1], [3, 4]]
    safe_numbers = 1
    
    # keep obtaining new lists until the _n is in a safe list
    while safe_numbers < _n:
        
        # get and save new_list_of_numbers
        next_numbers, put_in_previous = find_next_list(next_numbers)
        collection.append(next_numbers)
        
        # make previous list safe by appending put_in_previous numbers (these numbers belong to the range of this list)
        if put_in_previous:
            for value in put_in_previous:
                collection[-2].append(value)
            collection[-2].sort()  # sort for the added numbers to occupy their correct place
        
        # save last number for which result is safe (has put_in_previous)
        safe_numbers += len(collection[-2])

    # final answer (put collection of lists in a 1D-list)
    final_list = []
    previous = 0
    for alist in collection:
        for value in alist:
            if value != previous:  # the problem demands to ignore duplicates
                final_list.append(value)
                previous = value

    return final_list


def find_next_list(_numbers):
    """
    Gets the next list from the previous
    :examples:
    [3, 4] -> [7, 9, 10, 13], []
    [7, 9, 10, 13] -> [15, 19, 21, 22, 27, 28, 31, 40], []
    [15, 19, 21, 22, 27, 28, 31, 40] -> [43, 45, 46, 55, 57, 58, 63, 64, 67, 79, 81, 82, 85, 94, 118, 121], [39]
                                                                                 where [39] goes in the previous
    """

    # output_list
    future_numbers = [] # next list_of_numbers
    out_of_range = [] # numbers like 39 that belong to the current list and not to the future list

    # create generators for computing Y and Z formulas for current _numbers
    gen_y = calc_y(_numbers)
    gen_z = calc_z(_numbers)

    # helper variables
    selected = 0  # number selected for append to future_numbers (it may be Y, Z or OOR-out_of_range)
    max_numbers = max(_numbers)

    # variables for out_of_range numbers
    auxs_for_y = []  # list before computing Y
    auxs_for_z = []  # list before computing Z
    aux_y = 0  # next Y value
    aux_z = 0  # next Z value

    # take first value from generators
    next_y = next(gen_y)
    next_z = next(gen_z)

    # compute Y and Z using current_numbers until both gens are done
    while next_y or next_z:

        # --- HANDLE VALUE SELECTION ---

        # oor_Y is lowest ' -> take oor_Y
        if aux_y and is_lower(aux_y, [aux_y, aux_z, next_y, next_z]):
            selected = aux_y

            # load new oor_y if possible
            if auxs_for_y:
                x = auxs_for_y.pop(0)
                aux_y = 2 * x + 1

        # oor_Z is lowest ' -> take oor_Z
        elif aux_z and is_lower(aux_z, [aux_y, aux_z, next_y, next_z]):
            selected = aux_z

            # load new oor_z if possible
            if auxs_for_z:
                x = auxs_for_z.pop(0)
                aux_z = 3 * x + 1

        # both gens are working -> take the lower gen
        elif next_y and next_z:

            # Y is lower -> select Y and load new Y
            if next_y <= next_z:
                selected = next_y
                try:
                    next_y = next(gen_y)
                except StopIteration:
                    next_y = 0

            # Z is lower -> select Z and take new Z
            else:
                selected = next_z
                try:
                    next_z = next(gen_z)
                except StopIteration:
                    next_z = 0

        # gen_Y is done -> take from Z
        elif not next_y:
            selected = next_z
            try:
                next_z = next(gen_z)
            except StopIteration:
                next_z = 0

        # gen_Z is done -> take from Y
        elif not next_z:
            selected = next_y
            try:
                next_z = next(gen_y)
            except StopIteration:
                next_y = 0

        # --- HANDLE SELECTED VALUE ---
        
        # selected is higher than max(current _numbers) -> save to future_numbers
        if selected >= max_numbers:
            future_numbers.append(selected)

            # if selected is oor -> reload next oor
            if selected == aux_y:
                aux_y = 0 if not auxs_for_y else auxs_for_y.pop(0)

            elif selected == aux_z:
                aux_z = 0 if not auxs_for_z else auxs_for_z.pop(0)

        # selected is lower than max_numbers -> save to oor if not repeated
        else:
            if selected not in _numbers: # duplicates must be ignored
                
                # save to out_of_range output list
                out_of_range.append(selected)

                # save to oor for latter processing withing this own loop
                auxs_for_y.append(selected)
                auxs_for_z.append(selected)

                # load oor_y if were  empty
                if not aux_y:
                    if not auxs_for_y:
                        aux_y = 0
                    else:
                        x = auxs_for_y.pop(0)
                        aux_y = x*2 + 1

                # evaluate aux_z if were empty
                if not aux_z:
                    if not auxs_for_z:
                        aux_z = 0
                    else:
                        x = auxs_for_z.pop(0)
                        aux_z = x * 3 + 1

    # return numbers for next_list and the ones that should be added to this one
    return future_numbers, out_of_range


# Generator for Y
def calc_y(_list):
    for value in _list:
        yield 2 * value + 1


# Generator for z
def calc_z(_list):
    for value in _list:
        yield 3 * value + 1


#
def is_lower(_ref, _nums):
    """
    (int) -> (list_of_ints)
    :return: True if _ref is lower that ints in _nums
             ignores ints from _nums that are zero o not existent
    """
    non_zero_nums = [value for value in _nums if value]
    return True if _ref == min(non_zero_nums) else False


def dbl_linear(wanted):
  	"""
    (int) -> (int)
    :param _n: int with wanted iteration of solution
    :return: wanted iteration of solution

    :description:
    Consider a sequence U where U is defined as follows:
        1. The number U(0) = 1 is the first one in U.
        2. For each X in U, then Y = 2 * X + 1 and Z = 3 * X + 1 must be in U too
        3. There are no other numbers in U

    Ex. U = [1, 3, 4, 7, 9, 10, 13, 15, 19, 21, 22, 27, ...]
    1 gives 3 and 4,
    3 gives 7 and 10
    4 gives 9 and 13
    7 gives 15 and 22
    and so on...

    The task is to find iteration _n, for example iteration _n = 10 is 22

    :note:
    The only way to get done this in time is to use memorization.

    The trick is to find all values until 60 000 which is the highest requested
    All lower values are obtained just by looking in the list
    """
    global all_solutions
    return all_solutions[wanted]

max_n = 60000
all_solutions = find_all_twice_linear(max_n)
