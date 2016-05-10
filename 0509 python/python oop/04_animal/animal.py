import random # import the random module
class Animal(object):
	def __init__(self, name=None):
		self.name = name
		self.health = 100
		print "New Animal!!!" # when we create a new animal, we'll get this as an output
	def walk(self): # creating methods inside class, must put 'self' 
		print self.name, "walking..."
		self.health -= 1
		return self
	def run(self): # creating methods inside class, must put 'self' 
		print self.name, "running..."
		self.health -= 5
		return self
	def displayHealth(self):
		print self.name, "health is", self.health
		return self

animal = Animal('animal').walk().walk().walk().run().run().displayHealth()

# New Animal!!!
# animal walking...
# animal walking...
# animal walking...
# animal running...
# animal running...
# animal health is 87