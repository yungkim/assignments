class Bike(object):
	def __init__(self, price=None, max_speed=None):
		self.price = price
		self.max_speed = max_speed
		self.miles = 0
	def displayInfo(self):
		print "Price:", self.price, "Max Speed:", self.max_speed, "Miles:", self.miles, "\n"
		return self
	def ride(self):
		print "Riding"
		self.miles += 10
		return self
	def reverse(self):
		print "Reversing"
		if self.miles > 0:
			self.miles -= 5
		return self
# one way to display
cervelo = Bike(3000, "60mph")
cervelo.ride().ride().ride().reverse().displayInfo()
# and another way
specialized = Bike(2000, "55mph").ride().ride().reverse().reverse().displayInfo()
# and another without creating instance name
Bike(1000, "50mph").reverse().reverse().reverse().displayInfo()

# Riding
# Riding
# Riding
# Reversing
# Price: 3000 Max Speed: 60mph Miles: 25 

# Riding
# Riding
# Reversing
# Reversing
# Price: 2000 Max Speed: 55mph Miles: 10 

# Reversing
# Reversing
# Reversing
# Price: 1000 Max Speed: 50mph Miles: 0 
