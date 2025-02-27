''' ------------------------ GIL --------------------- '''
# Global Interpreter Lock (GIL) prevents multiple python threads to be 
# executed at the same time. This is because the Interpreter needs to 
# transform the code into ByteCode first. The must common interpreter 
# is CPython which transform the code into C.

# Other python interpreters don't have the GIL like Jython (Java based),
# IronPython (.net based) and PyPy-STM.

# To avoid the GIL you can use external libraries written in C++.

# With Python what you can do is use multiple processes instead of multiple threads.
# Each Python process will have its own instance of the interpreter and the GIL.
# So, for that you can use a multiprocessing package. The downside is that communication
# between processes is more complicated that between threads, and also multiple processes
# use more resources than multiple threads.