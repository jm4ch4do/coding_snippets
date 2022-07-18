''' ----------------------- EXAMPLE --------------------- '''
# Athletes winning medals in Beijing Olympics 100m or 200m
data = oo[(oo.Edition == 2008) & ( (oo.Event == '100m') | (oo.Event == '200m') )]

# count by country, gender, discipline, event
data.groupby(['NOC', 'Gender', 'Discipline', 'Event']).size()

# revert groupby by unstacking
gb.unstack(['Discipline','Event'])
