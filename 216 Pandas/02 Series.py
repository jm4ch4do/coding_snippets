''' ------------------- CONCEPT ---------------- '''
# Dataframe in pandas is a table
# Series is a field
# The first column is usually the index

# Three different ways of accesing a series
DataFrame['seriesName']
DataFrame["seriesName"]
DataFrame.SeriesName  # doesn't work is there is a space in the serie's name

# Access multiple series
DataFrame[['SeriesName1', 'SeriesName2']]

# identify type of object (Dataframe or Series)
type(DataFrame)
# if you selected more than one series then the object type is dataframe


''' ------------------- WORKING DIRECTORY ---------------- '''
# get working directory
import os
cwd = os.getcwd()




''' ------------------- READ FILE ---------------- '''
file_path = './data/olympics.csv'
oo = pd.read_csv(file_path, skiprows=4)  # read file


''' -------------- DISPLAY DATAFRAME ------------- '''
oo.head()  # see first 5 lines of data frame
oo  # display first 5 and last 5 lines of data frame


''' -------------- DISPLAY SERIES ------------- '''
OO['city']

# dataframe with 4 series
oo[['Edition', 'City', 'Athlete', 'Medal']]


''' -------------- DISPLAY SPECIFIC LINE ------------- '''
oo.index