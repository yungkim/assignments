class Car(object):
	def __init__(self, price=None, speed=None, fuel=None, mileage=None):
		self.price = price
		self.speed = speed
		self.fuel = fuel
		self.mileage = mileage
		if price > 10000:
			self.tax = .15
		elif price > 0:
			self.tax = .12
		self.display_all()
	def display_all(self):
		print "Price:", self.price, "\nSpeed:", self.speed, "\nFuel:", self.fuel, "\nMileage:", self.mileage, "\nTax:", self.tax, "\n"

fast_car = Car(2000, "35mph", "Full", "15mpg")
slowest_car = Car(2000, "5mph", "Not Full", "105mpg")
slow_car = Car(2000, "15mph", "Kind of Full", "95mpg")
normal_car = Car(2000, "25mph", "Full", "25mpg")
fastest_car = Car(2000, "45mph", "Empty", "25mpg")
expensive_car = Car(20000000, "35mph", "Empty", "15mpg")

# Price: 2000 
# Speed: 35mph 
# Fuel: Full 
# Mileage: 15mpg 
# Tax: 0.12 

# Price: 2000 
# Speed: 5mph 
# Fuel: Not Full 
# Mileage: 105mpg 
# Tax: 0.12 

# Price: 2000 
# Speed: 15mph 
# Fuel: Kind of Full 
# Mileage: 95mpg 
# Tax: 0.12 

# Price: 2000 
# Speed: 25mph 
# Fuel: Full 
# Mileage: 25mpg 
# Tax: 0.12 

# Price: 2000 
# Speed: 45mph 
# Fuel: Empty 
# Mileage: 25mpg 
# Tax: 0.12 

# Price: 20000000 
# Speed: 35mph 
# Fuel: Empty 
# Mileage: 15mpg 
# Tax: 0.15 
#