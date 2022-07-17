''' ------------------- IMPORT ---------------- '''
# to show graphics on the Jupyter Notebook
%matplotlib notebook
%matplotlib inline

# import numpy and matplotlib
import numpy as np
import matplotlib.pyplot as plt


''' ------------------- SIMPLE PLOT ---------------- '''
avg_temp = [39.1, 40.1, 48.0, 50.4, 60.3, 73.7, 80.0, 76.9, 68.8, 57.9, 53.0, 39.2]  # DATA
fig = plt.figure()  # create figure
plt.plot(avg_temp)  # create plot
plt.show  # display plot


''' ------------------- TITLE AND LABELS ---------------- '''
plt.title("Average monthly temperatures")
plt.xlabel("months")
plt.ylabel("temperatures")
plt.show  


''' ------------- FULL EXAMPLE / DEFINE X AXIS ---------- '''
# data
avg_temp = [39.1, 40.1, 48.0, 50.4, 60.3, 73.7, 80.0, 76.9, 68.8, 57.9, 53.0, 39.2]  # DATA
months = ['Jan', 'Feb', 'Mar', 'Apr', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

# figure and plot
fig = plt.figure()  
plt.plot(months, avg_temp)

# tags
plt.title("Average monthly temperatures")
plt.xlabel("months")
plt.ylabel("temperatures")

# show and save
plt.show  
fig.savefig('avg_temperatures.png')
fig.savefig('avg_temperatures.pdf')

