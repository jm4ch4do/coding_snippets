''' -------------------- PIE CHARTS ---------------- '''
prefered_location = [10.7, 47.6, 38.8, 2.9]

colors = ['b', 'g', 'r', 'c']
labels = ['Collocated', 'Hybrid', 'Fully Remote', 'Not applicable']

explode = (0, 0.2, 0, 0)

plt.pie(prefered_location, colors=colors, labels=labels,
        explode=explode, autopct='%1.1f%%',
        counterclock=False, shadow=True)

plt.title('Prefered Work Location')
plt.show()


''' -------------------- BAR CHARTS ---------------- '''
prefered_location = [10.7, 47.6, 38.8, 2.9]

colors = ['b', 'g', 'r', 'c']
labels = ['Collocated', 'Hybrid', 'Fully Remote', 'Not applicable']

widths = [0.7, 0.7, 0.7, 0.7]

plt.bar(range(0,4), prefered_location, width=widths, color=colors, align='center')

plt.title('Prefered Location')

plt.show()


''' ----------------- MORE CHART TYPES ------------- '''
# https://matplotlib.org/stable/gallery
