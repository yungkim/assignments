class Bike(object):
	def __init__(self, price=None, max_speed=None):
		self.price = price
		self.max_speed = max_speed
		self.miles = 0
	def displayInfo(self):
		print "Price: $",self.price," Max Speed:",self.max_speed," Miles:",self.miles
	def ride(self):
		print "Riding"
		self.miles += 10
	def reverse(self):
		print "Reversing"
		if self.miles > 0:
			self.miles -= 5

cervelo = Bike(3000, "60mph")
cervelo.ride()
cervelo.ride()
cervelo.ride()
cervelo.reverse()
cervelo.displayInfo()

specialized = Bike(2000, "55mph")
specialized.ride()
specialized.ride()
specialized.reverse()
specialized.reverse()
specialized.displayInfo()

track = Bike(1000, "50mph")
track.reverse()
track.reverse()
track.reverse()
track.displayInfo()

# Riding
# Riding
# Riding
# Reversing
# Price: $ 3000  Max Speed: 60mph  Miles: 25
# Riding
# Riding
# Reversing
# Reversing
# Price: $ 2000  Max Speed: 55mph  Miles: 10
# Reversing
# Reversing
# Reversing
# Price: $ 1000  Max Speed: 50mph  Miles: 0