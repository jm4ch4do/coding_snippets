''' ------------------- CONCEPT ---------------- '''
# Using pandas you can read data from csv, excel, json or sql table



''' ------------------- CSV ---------------- '''
oo = pd.read_csv(filepath,..., skiprows=3)  # skips the first 3 lines of data in file

# confirm dimensions of dataframe after reading
oo.shape  # (29216, 10)  29216 rows and 10 columns
oo.info()  # more info


''' ------------------- HEAD TAIL ---------------- '''
oo  # output both head and tail
oo.head()  # first 5 rows
oo.head(20) # first 20 rows
oo.tail()
oo.tail(20)