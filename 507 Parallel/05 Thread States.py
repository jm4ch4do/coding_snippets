''' ------------------------ STATES --------------------- '''
# When a new program starts it has one process with one thread. That's the main thread.
# The main thread may create child threads.
# When they are created they are in the new state.
# To make the thread work you have to start it, which puts it in the Runnable state.
# When a thread needs to wait for an event like an external input or timer is goes
# to the blocked state. While in that states, it does not consume cpu resources.

# You can use join to wait for the child thread to finish. After finishing, the child thread
# will notify the parent and enter the final terminate step



''' --------------------- EXAMPLE OF JOIN ------------------ '''
import threading
import time

class ChefOlivia(threading.Thread):
    def __init__(self):
        super().__init__()
        
    def run(self):
        print('Olivia started & waiting for sausage to thaw...')
        time.sleep(3)
        print('Olivia is done cutting sausage.')
        

# main thread a.k.a. Barron
if __name__ == '__main__':
    print("Barron started & requesting Olivia's help.")
    olivia = ChefOlivia()
    print(' Olivia alive?', olivia.is_alive())
    
    print('Barron tells Olivia to start.')
    olivia.start()
    print(' Olivia alive?', olivia.is_alive())
    
    print('Barron continues cooking soup.')
    time.sleep(0.5)
    print(' Olivia alive?', olivia.is_alive())
    
    print('Barron patiently wait for Olivia to finish and join...')
    olivia.join()
    print(' Olivia alive?', olivia.is_alive())
    
    print('Barron and Olivia are both done!')
    