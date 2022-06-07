# -------------------------SINGLY LINK LIST-------------------------
# A singly linked list is a collection of nodes that form a linear sequence
# Each node stores a reference to an element and to the next node
# Is like a flight with several scales were each planes knows about itself
# and the next scale
# git is also a linked list
# The head of the linked list is the first node
# the tail is the last node which has no reference
# going though the nodes is called traversing (or link hopping or pointer hopping)
# elements may be inserted both at the tail or head of the linked list
# deleting the first element can be easily done
# but the last element doesn't know about the previous to last, so it's hard to delete
# because we'll need to traverse all the list to find the previous to last
# So, deleting the last is inefficient unless we use a double linked list.

# PRO: Nodes have constant time to insert and remove from any position
# while arrays have O(n)
# Linked list can also grow without specifying size while arrays have to allocate

# CONS: To access and element you need to consume O(k) time while arrays consume constant

# CONCLUSION: Going to and inserting one element cost the same for both, but when inserting
# several elements in the same position then is better to use linked_list

class Node:

    def __init__(self, value):

        self.value = value
        self.next = None

def test_linked_list():
    a = Node(1)
    b = Node(2)
    c = Node(3)

    a.nextnode = b
    b.nextnode = c


# -------------------------DOUBLE LINK LIST-------------------------
# Every node has a reference to the node before and the node after
# At the start and end we have the header and trailer sentinels nodes
# which are empty nodes. The header only contains a reference to next 
# and the trailer to prev.

# it's used in the back and forward button in the browser

# PRO: You may delete the current element O(1) while to delete and element in single index
# you have to know the previous element also.

class DoubleLinkedListNode:

    def __init__(self, value):

        self.value = value
        self.next_node = None
        self.prev_node = None

def double_test():
    a = DoubleLinkedListNode(1)
    b = DoubleLinkedListNode(2)
    c = DoubleLinkedListNode(3)

    b.prev_node = a
    a.next_node = b

    b.next_node = c
    c.prev_node = b

    