""" Threads that waste CPU cycles """

import os
import threading

# a simple function that wastes CPU cycles forever
def cpu_waster():
    while True:
        pass
    
    
# display information about this process
print("\n Process ID:", os.getpid())
print('Thread Count:', threading.active_count())
for thread in threading.enumerate():
    print(thread)
    
print('\n Starting 4 CPU Wasters... ')
for i in range(4):
    threading.Thread(target=cpu_waster).start()
    
# display information about this process
print("\n Process ID:", os.getpid())
print('Thread Count:', threading.active_count())
for thread in threading.enumerate():
    print(thread)
    
    
# OUTPUT    
#    
# Process ID: 996
# Thread Count: 1
# <_MainThread(MainThread, started 10528)>
#
# Starting 4 CPU Wasters... 
#
# Process ID: 996
# Thread Count: 5
# <_MainThread(MainThread, started 10528)>
# <Thread(Thread-1, started 11696)>
# <Thread(Thread-2, started 16904)>
# <Thread(Thread-3, started 2648)>
# <Thread(Thread-4, started 12524)>