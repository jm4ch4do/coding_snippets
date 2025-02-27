''' ------------------- CONCEPT ---------------- '''
# Pandas always treats one series of the dataframe as an
# index and it does not allow to modify this field
# you can also set a label as index instead of a number


''' ------------------- CONCEPT ---------------- '''
# By default, the index is assumed to be the first series
# if is not, you can set it using a DataFrame attribute
DataFrame.set_index(keys, drop=True, append=False, 
                    inplace=False, verify_integrity=False)

oo.set_index('Athlete')  # set Athlete as index
oo.set_index('Athlete', inplace=True)  # changes are made to original
oo.reset_index(inplace=True)  # index gets back to first column

ath = oo.set_index('Athlete')  # save dataframe with new index to a var


''' ------------------- SORT BY INDEX ---------------- '''
ath.sort_index(inplace=True, ascending=False)


''' ------------------- LABEL INDEX ---------------- '''
oo.set_index('Athlete', inplace=True)
oo.loc['BOLT, Usain']  # search by label index
