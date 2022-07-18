''' ----------------------- CONCEPT --------------------- '''
# Group by splits a DataFrame into groups sharing a common criteria
# Apply a function to each group independently
# Combine the results into a DataFrame

# A groupby is a group of dataframes in a dict like structure


''' ------------------- GROUP BY EXAMPLE ---------------- '''
gb = oo.groupby('Edition')  # returns groupby object
list(gb)  # displays group by

# iterate through the group by
for group_key, group_value in gb:
    print(group_key)  # key is the field that was used for the GroupBy
    print(group_value)  # the rest of the fields are the values
    

''' ----------------- GROUP BY MULTIPLE FIELDS ------------ '''
gb2 = oo.groupby(['Edition', 'NOC', 'Medal'])


''' ----------------------- AGGREGATE FUNCTIONS ------------------- '''
gb.size()  # count of elements in each group
           # for the example it will output total medals per Edition
    
gb.agg(['min'])  # searches the min of every field


''' ----------------- EXAMPLES ------------ '''
# get total price and total amount of 'Fee' of courses
df2 = df.groupby('Courses')['Fee'].agg(['sum','count'])

# other way to get the same
df2 = df.groupby('Courses').agg({'Fee': ['sum','count']})

# GroupBy multiple columns using agg()
df2 = df.groupby(['Courses','Duration'])['Discount'].agg("sum")

# Transform does the same but doesn't show 'Courses' or 'Fee' in the output
df2 = df.groupby(['Courses', 'Fee'])['Discount'].transform('sum')


''' ----------------- CHALLENGE ------------ '''
# Using groupby(), plot the total number of medals awarded at each of the
# Olympic games throughtout history.
gb = oo.groupby('Edition')
gb['Medal'].agg('count')

# Create a list showing the total number of medals won for each country over
# the history of the Olympics. For each country, include the year of the first
# and most recent Olympic medal wins.
gb = oo.groupby('NOC')
medals_by_country = gb['Medal'].count()
medals_by_country.sort_values(ascending=False)














''' ----------------------- MORE EXAMPLES ------------------- '''
https://sparkbyexamples.com/pandas/pandas-groupby-sum-examples/
    
    
import pandas as pd
technologies   = ({
    'Courses':["Spark","PySpark","Hadoop","Python","Pandas","Hadoop","Spark","Python"],
    'Fee' :[22000,25000,23000,24000,26000,25000,25000,22000],
    'Duration':['30days','50days','55days','40days','60days','35days','55days','50days'],
    'Discount':[1000,2300,1000,1200,2500,1300,1400,1600]
                })
df = pd.DataFrame(technologies, columns=['Courses','Fee','Duration','Discount'])
print(df)

# Use GroupBy() to compute the sum
df2 = df.groupby('Courses').sum()
print(df2)

# Using GroupBy multiple column
df2 = df.groupby(['Courses','Duration'])['Fee'].sum()
print(df2)

# Groupby and get sum() and count()
df2 = df.groupby('Courses')['Fee'].agg(['sum','count'])
print(df2)

# Pandas groupby get sum() and count()
df2 = df.groupby('Courses').agg({'Fee': ['sum','count']})
print(df2)

# Remove sorting on grouped results
df2=df.groupby(by=['Courses'], sort=False).sum()
print(df2)

# Sorting group keys on descending order
groupedDF = df.groupby('Courses',sort=False).sum()
sortedDF=groupedDF.sort_values('Courses', ascending=False)
print(sortedDF)

# Using as_index=False
df2 = df.groupby('Courses', as_index =False)['Fee'].sum()

# Using reset_index()
df2 = df.groupby(['Courses'])['Fee'].sum().reset_index()
print(df2)

# GroupBy multiple columns using agg()
df2 = df.groupby(['Courses','Duration'])['Discount'].agg("sum")
print(df2)

# GroupBy multiple columns using transform()
df2 = df.groupby(['Courses', 'Fee'])['Discount'].transform('sum')
print(df2)

# GroupBy multiple columns using pivot function
df2 = df.groupby(['Courses','Duration'],as_index = False).sum().pivot('Courses','Duration').fillna(0)
print(df2)

# DataFrame.set_index using sum with level
df2 = df.set_index(['Courses','Duration']).sum(level=[0,1])
print(df2)
