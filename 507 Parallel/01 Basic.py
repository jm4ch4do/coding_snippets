''' ------------------------ SOURCE --------------------- '''
# https://www.linkedin.com/learning/python-parallel-and-concurrent-programming-part-1/


''' ------------------------ PARALLEL ARCHITECTURES --------------------- '''
# Flynn's Taxonomy categorizes the architecture of a parallel solution

# Single Instruction Single Data (SISD): One cpu execute sequential instructions

# Single Instruction Multiple Data (SIMD): 
# One set of instructions is executed by multiple processors, each operates on a 
# different piece of data. Used in image processing since it does the same operation
# for different portions of the image. GPU (Graphic Processing Units) are used by
# computers to process images.

# Multiple Instruction, Single Data (MISD): Each processin unit executes a different
# set of instructions over the same data. Is not a commonly use architecture.

# Multiple Instruction, Multiple Data (MIMD): Every processing unit can execute a different
# instruction on a different set of data. Is the most common used architecture. Used in
# multi-core PCs and network clusters in supercomputers.

# MIMD is further divided into:
#   Single Program, Multiple Data (SPMD): Multiple processor execute a copy of the same program
#   at the same time. They don't have to be executing the exact same instruction at the same time.
#   Is the most common approach.


#   Multiple Program, Multiple Data (MPMP): Multiple processors execute different programs on 
#   different data. One processor is selected as the host or manager running a program that
#   passes data to the other nodes running a second program and return the result to the
#   manager when they are done. Is not as common as the previous one but still used when applying
#   functional decomposition.


''' ---------------------------- MEMORY USAGE ------------------------- '''
# When one processor is accesing a memory location the others can't and usually processors work
# faster than memory. For solving this you can used shared memory

# Shared Memory: All processors access the same memory with global address space. Thus, every
# processor is aware of every change in the memory.

#   Uniform Memory Access (UMA): All processors have equal access to memory so they can access it
#   equally fast. The most common UMA is the SMP (Symmetric Multiprocessing System). In SMP
#   multiple processor connect to the memory using a system bus and the usually have an independent
#   cache each.

#   Not Uniform Memory Access (NUMA): Some processors have faster access to part of memory.

#   Distributed Memory Architecture: Each processor has its own local memory. The programmer needs
#   to define how and when data is communicated between processors. This communication requirement
#   is a disanvantage. However, the main advantage of this approach is that it can scale. This
#   architecture is used by supercomputers.


''' ---------------------------- PROCESS ------------------------- '''

# A process includes the program's code, data and state information. Each process is independent
# and has is own separate space in memory.

# Within each process you can have multiple threads, each representing a differnt path of execution.
# Threads are the basic unit that the operating system schedules for execution.

# Sharing resources between threads is easy but is complicated to share resources between processes.
# For that you have to use sockets and pipes, shared memory or remote procedure calls. So, for
# common cases the use of threads is prefered.


''' ---------------------------- CONCURRENCY ------------------------- '''
# Two algorithms are concurrend when they are independent and can be executed overlapping in time.
# You can have concurrency even with a single processor because both threads will use the same
# processor taking turns.

# Most computers today have multi-core processors. GPUs contain hundrens of small cores. If you
# have the hardware needed and a program using concurrency you can execute in parallel.