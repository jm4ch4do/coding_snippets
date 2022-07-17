''' -------------------- DATE ---------------- '''
import numpy as np
np.datetime64('2022-03-01')  # specific day
np.datetime64('2022-03'  # specific month)
              
# number of weekdays in 2022
np.busday_count('2022', '2023')
              
              
# number of weekdays in June 2022
np.busday_count('2022-06', '2022-07')