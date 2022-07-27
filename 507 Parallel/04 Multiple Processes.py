''' ------------------------ MULTIPROCESSING --------------------- '''
import os
import threading
import multiprocessing as mp

# a simple function that wastes CPU cycles forever
def cpu_waster():
    while True:
        pass
    
if __name__ == '__main__':  # only continue down if it's the main process
    # display information about this process
    print("\n Process ID:", os.getpid())
    print('Thread Count:', threading.active_count())
    for thread in threading.enumerate():
        print(thread)

    print('\n Starting 4 CPU Wasters... ')
    for i in range(4):
        mp.Process(target=cpu_waster).start()

    # display information about this process
    print("\n Process ID:", os.getpid())
    print('Thread Count:', threading.active_count())
    for thread in threading.enumerate():
        print(thread)