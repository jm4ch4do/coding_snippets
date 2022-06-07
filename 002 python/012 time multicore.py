''' ----------------------- MEASURE TIME ELAPSED  ----------------------  '''
import time
t0= time.clock()
print("Hello")
t1 = time.clock() - t0
print("Time elapsed: ", t1 - t0) # CPU seconds elapsed (floating point)

''' ---------------------------- USE MULTICORE  ------------------------  '''
from multiprocessing import Pool


def sum_square(number):
    s = 0
    for i in range(number):
        s += i * i

    return s


if __name__ == '__main__':
    numbers = [0, 1, 2, 3, 4]
    p = Pool()  # with no argument it takes the maximum number of processors
    result = p.map(sum_square, numbers)

    p.close()
    p.join()
    print(result)


''' ---------------------------- USE MULTICORE  ------------------------  '''
import multiprocessing as mp

#init objects
pool = mp.Pool()
jobs = []

#create jobs
with open("input.txt") as f:
    for line in f:
        jobs.append( pool.apply_async(process,(line)) )

#wait for all jobs to finish
for job in jobs:
    job.get()

#clean up
pool.close()


''' -------------------------- COUNT PROCESSORS  -----------------------  '''
# use this one
import os
print(os.cpu_count())

# or this one
import multiprocessing
print(multiprocessing.cpu_count())

