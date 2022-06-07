# -------------------------STACKS-------------------------
# A stack is and ordered collection where inserting and removal
# takes places at the same end referred to as "top"
# the far end is known as the "base"

# stack = [base, second, third, top]
#                               insert or            
#                               remove here
# LIFO - Last In First Out Logic applies to Stacks
# Stacks are commonly use to reverse the order of items.
# Stacks are used, for example, when you hit the back button of your browser

# ----- STACK CLASS IMPLEMENTATION -----
# list have all stack required methods implemented.
class Stack:

    # create empty stack as and empty list on object creation
    def __init__(self):
        self.items = []

    # method for finding if stack is empty
    def isEmtpy(self):
        return self.items == []

    # inserting elements into the stack
    def push(self, item):
        self.items.append(item)

    # retrieving elements
    def pop(self):
        return self.item.pop()

    # return top item
    def peek(self):
        return self.items[len(self.items)-1]

    # stack size
    def size(self):
        return len(self.items)


# -------------------------QUEUE-------------------------

# a queue is an ordered collection where new elements enter
# by one end ("rear") and the removal occurs at the other end ("front")
# FIFO - First In First Out
# Queues are the system used in lines for movies or grocery stores
# Enqueue: add new item
# Dequeue: remove item
# list also have queue methods implemented (Pop, Push)

# ----- QUEUE CLASS IMPLEMENTATION -----
class Queue:

    def __init__(self):
        self.items = []

    def isEmpty(self):
        return self.items == []

    def enqueue(self, item):
        self.items.insert(0, item)

    def dequeue(self):
        return self.items.pop()

    def size(self):
        return len(self.items)

def test_queue():
    q = Queue()
    q.isEmpty()
    q.enqueue(1)
    q.enqueue(2)
    q.dequeue()


# -------------------------DEQUE-------------------------
# Also known as double-ended queue is an ordered collection
# of items similar to the queue. It hast two ends front and rear
# New items can be added both at the front or end. Same goes for removing

# ----- DEQUE CLASS IMPLEMENTATION -----