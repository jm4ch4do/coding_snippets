''' ------------------- UNIQUE VALUES ---------------- '''
# counts the repetitions of every unique value
# (below are the default parameters)
series.value_counts(normalize=False, sort=True,ascending=False,
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


''' ------------------- BOOLEAND INDEXING ---------------- '''
& | ~  # AND OR NOT operators in pandas

# returns True for lines with gold and false for others
oo.Medal == 'Gold'  

# all athletes who won a gold medals
oo[oo.Medal == 'Gold']  # only show lines with gold medals

# all female athletes who won a gold medals
oo[(oo.Medal == 'Gold') & (oo.Medal == 'Women')]


''' ------------------- STRING HANDLING ---------------- '''
Series.str  # access values as string and provides useful methods

Series.str.contains()
Series.str.startswith()
Series.str.isnumeric()

# example
oo[oo.Athlete.str.contains('Florence')]  # get athletes whose name starts with 'Florence'


''' ------------------- EXAMPLES ---------------- '''
import pandas as pd
file_path = './data/olympics.csv'
oo = pd.read_csv(file_path, skiprows=4)

# In which events did Jesse Owens win a medal?
jesse_records = oo[oo.Athlete.str.contains('OWENS, Jesse')]
jesse_records.Event.value_counts()

# Which country has won the most men's gold medals in singles 
# badminton over the years? Sort the results alphabetically
# by the player's names.
badminton_male_single = oo[(oo.Discipline == 'Badminton') & 
                           (oo.Event_gender == 'M') & 
                           (oo.Event == 'singles')]
badminton_male_single.NOC.value_counts()
badminton_male_single.sort_values(by='Athlete')

# Which three countries have won the most medals in recent years (from 1984 to 2008)
recent_years = oo[(oo.Edition >= 1984) & (oo.Edition <= 2008)]
recent_years.NOC.value_counts().head(10)

# Display the male gold medal winners for the 100m track and field
# sprint event over the years. List results starting with the most recent.
# Show the Olympic city, edition, athlete and the country they represent.
Athletics_100m = oo[(oo.Event == '100m') & (oo.Discipline=='Athletics')]
Athletics_100m_sorted = Athletics_100m.sort_values(by='Edition', ascending=False)
Athletics_100m_sorted[["City","Edition","Athlete", "NOC"]]