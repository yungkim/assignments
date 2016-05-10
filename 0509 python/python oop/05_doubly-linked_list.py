class DoublyLinkedList(object): # contains functions for adding/removing a new node, printing out values in linked list
	def __init__(self):
		self.head = None
		self.tail = None
		print "Station Initiated... Station has head and tail."
	def add_node(self, value): # pass value where to add node
		print "Adding node...", value
		new_node = Node(value, None, None) # prev, next not assigned yet for new node
		if self.head is None:
			self.head = self.tail = new_node
		else:
			new_node.prev = self.tail
			new_node.next = None
			self.tail.next = new_node
			self.tail = new_node
		return self
	def remove_node(self, node_value): # remove nth value
		print "Removing node...", node_value
		current_node = self.head
		while current_node is not None:
			if current_node.value == node_value:
	            # if it's not the first element
				if current_node.prev is not None:
					current_node.prev.next = current_node.next
					current_node.next.prev = current_node.prev
				else:
					# otherwise we have no prev (it's None), head is the next one, and prev becomes None
					self.head = current_node.next
					current_node.next.prev = None
 
			current_node = current_node.next

		return self
	def show(self):
		print "*"*50,"\nDoubly-Linked List:"
		current_node = self.head
		while current_node is not None:
			print current_node.prev.value if hasattr(current_node.prev, "value") else None,
			print current_node.value,
			print current_node.next.value if hasattr(current_node.next, "value") else None
			current_node = current_node.next
		print "*"*50

class Node(object): # has necessary properties for node
	def __init__(self, value, prev=None, next=None):
		self.value = value
		self.prev = prev
		self.next = next


myList = DoublyLinkedList()
 
myList.add_node(5)
myList.add_node(6)
myList.add_node(50)
myList.add_node(30)
myList.add_node(77)
 
myList.show()
 
myList.remove_node(50)
myList.remove_node(5)
myList.remove_node(30)
 
myList.show()

# Station Initiated... Station has head and tail.
# Adding node... 5
# Adding node... 6
# Adding node... 50
# Adding node... 30
# Adding node... 77
# ************************************************** 
# Doubly-Linked List:
# None 5 6
# 5 6 50
# 6 50 30
# 50 30 77
# 30 77 None
# **************************************************
# Removing node... 50
# Removing node... 5
# Removing node... 30
# ************************************************** 
# Doubly-Linked List:
# None 6 77
# 6 77 None
# **************************************************