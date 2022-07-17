''' -------------------- COLORS ---------------- '''
%matplotlib notebook
%matplotlib inline

import numpy as np
import matplotlib.pyplot as plt

x = np.arange(3)  # [0, 1, 2]
fig = plt.figure()  # create figure
plt.plot(x, color='r')
plt.plot(x,2*x, color='green')
plt.plot(x,3*x, color='#000000')
plt.grid(True)
plt.show()


''' -------------------- LINE TYPES ---------------- '''
%matplotlib notebook
%matplotlib inline

import numpy as np
import matplotlib.pyplot as plt

x = np.arange(3)  # [0, 1, 2]
fig = plt.figure()  # create figure
plt.plot(x, linestyle='solid')
plt.plot(x,2*x, linestyle='dashed')
plt.plot(x,3*x, linestyle='dashdot')
plt.plot(x,4*x, linestyle='dotted')
plt.grid(True)
plt.show()


# another way
x = np.arange(3)  # [0, 1, 2]
fig = plt.figure()  # create figure
plt.plot(x, linestyle='-')
plt.plot(x,2*x, linestyle='--')
plt.plot(x,3*x, linestyle='-.')
plt.plot(x,4*x, linestyle=':')
plt.grid(True)
plt.show()


# simplified green with -.
plt.plot(x, 3*x, '-.g')
