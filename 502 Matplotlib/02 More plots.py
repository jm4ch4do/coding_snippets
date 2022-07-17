''' -------------------- SEVERAL PLOTS IN SAME FIGURE ---------------- '''
x = np.arange(3)  # [0, 1, 2]
fig = plt.figure()  # create figure
plt.plot(x)
plt.plot(x,2*x)
plt.plot(x,3*x)
plt.grid(True)
plt.show()


''' -------------- SEVERAL PLOTS IN DIFFERENT MINI-FIGURES ----------- '''
fig = plt.figure()
x = np.arange(3)
y = 2 * x
plt.subplot(2,2,1)  # 2 rows, 2 cols, use space 1
plt.plot(x, y, 'b')  # blue color 

plt.subplot(2,2,2)  # 2 rows, 2 cols, use space 2
plt.plot(x, 1-y, 'r')  # red color 

plt.subplot(2,2,3)  # 2 rows, 2 cols, use space 3
plt.plot(x, 2-y, 'g')  # green color 

plt.subplot(2,2,4)  # 2 rows, 2 cols, use space 4
plt.plot(x, y, 'y')  # yellow color 


''' --------------------------- ANOTHER WAY ------------------------ '''
fig, axs = plt.subplots(2, 2, figsize = (6, 6))
axs[0, 0].plot(x, y, 'b') 
axs[0, 1].plot(x, 1-y, 'r')
axs[1, 0].plot(x, 2-y, 'g')
axs[1, 1].plot(x, y, 'y')


''' ----------------------------- LABELS --------------------------- '''
fig = plt.figure()
x = np.linspace(1, 10)
first_line = plt.plot(x, x + 1, label= 'y=x+1')
plt.legend()  # label appears at top left



''' --------- TWO LINES WITH LABELS AND DIFFERENT LINE STYLES ------ '''
fig = plt.figure()
first_line, = plt.plot(x, x+1, linestyle='solid')
first_line.set_label('y=x+1')
second_line, = plt.plot(x, x+2, linestyle='solid')
second_line.set_label('y=x+2')
third_line, = plt.plot(x, x + 3, linestyle='dashed')
third_line.set_label('y=x+3')
plt.legend(bbox_to_anchor=(1.02, 1.0), borderaxespad=0)  # move the legend's position
