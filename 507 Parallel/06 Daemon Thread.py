''' ------------------------ DAEMON THREAD --------------------- '''
# A daemon thread will not prevent the program from exiting even if
# the thread is still running.

# By default, new threads are created as non-daemon. You have to set
# then to daemon to detach them from your program. Then, you can 
# terminate the main thread and the child will terminate as well.


''' ------------------------ EXAMPLE --------------------- '''
""" Barron finishes cooking while Olivia cleans """

import threading
import time

def kitchen_cleaner():
    while True:
        print('Olivia cleaned the kitchen.')
        time.sleep(1)
        
        
if __name__ = '__main__':
    olivia = threading.Thread(target=kitchen_cleaner)
    olivia.daemon = True
    olivia.start()
    
    print('Barron is cooking')
    time.sleep(0.6)
    print('Barron is cooking')
    time.sleep(0.6)
    print('Barron is cooking')
    time.sleep(0.6)
    print('Barron is done!')
    