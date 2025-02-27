''' -------------------- HISTOGRAM ---------------- '''
import numpy as np
import matplotlib.pyplot as plt

# if using jupyter, all plots will be displayed in an interactive window
%matplotlib notebook  

x = np.random.randn(10000)

plt.hist(x, bins = 20)


''' ----------------------- 3D ------------------- '''
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
%matplotlib notebook

fig = plt.figure()
ax = fig.add_subplot(projections='3d')

theta = np.linspace(-3 * np.pi, 3 * np.pi, 200)
z = np.linspace(-3, 3, 200)
r = z**3 + 1
x = r * np.sin(theta)
y = r * np.cos(theta)

ax.plot(x, y, z, label='Parametric Curve')
ax.legend()
plt.show()