''' ------------------- UNIQUE VALUES ---------------- '''
# counts the repetitions of every unique value
# (below are the default parameters)
series.value_count(normalize=False, sort=True,ascending=False,
                   bins=None, dropna=True)


ascending = False  # show the value that occurs the most on top
dropna = True  # eliminates the count of missing data values(na values)


# examples
oo.Edition.value_counts()  # medals per edition
oo.Gender.value_counst()  # medals for men and women



''' ------------------- SORT ---------------- '''
series.sort_values(axis=0, ascending=True, inplace=False, kind='quicksort', na_position='last')
DataFrame.sort_values(by, axis=0, ascending=True, inplace=False, kind='quicksort', na_position='last')

axis=0 # sort in the column direction (not in the row direction)
inplace=False  # a new series is returned with results

# examples
oo.sort_values(by=['Edition', 'Athlete'])