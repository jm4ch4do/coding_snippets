''' -------------------- LOG SCALE ---------------- '''
x = np.linspace(1, 10, 1024)
plt.xscale('log')
plt.yscale('log')

plt.plot(x, x, label='$f(x)=x$')
plt.plot(x, 10**x, label='$f(x)=10^x$')
plt.plot(x, np.log(x), label='$f(x)=log(x)$')

plt.legend()
plt.show()

# fix
plt.xscale('log', basex=3)  # changes log scale to base 3



''' -------------------- TICKS ---------------- '''
# ticks are the small lines in the x-bar

from matplotlib.ticker import (MultipleLocator, AutoMinorLocator)
x = np.arange(0.0, 50.0, 0.1)
y = x**2

fig, ax = plt.subplots()
ax.plot(x, y)

ax.xaxis.set_major_locator(MultipleLocator(10))  # big marker every 10
ax.xaxis.set_major_formatter('{x:.0f}')

ax.xaxis.set_minor_locator(MultipleLocator(2))  # small marker every 2


''' -------------------- ANNOTATIONS ---------------- '''
X = np.linspace(0, 10)

y1 = x
y2 = 8-x

fig, ax = plt.subplots()
plt.plot(x, y1, label='supply')
plt.plot(x, y2, label='demand')

ax.annotate("Equilibrium", xy=(4,4), xytext=(3,2), \
            fontsize=12, fontweight="semibold", \
            arrowprops=dict(linewidth=2, arrowstyle="->"))

plt.xlabel('quantity', fontsize=12)
plt.ylabel('price', fontsize=12)

plt.legend()
plt.show