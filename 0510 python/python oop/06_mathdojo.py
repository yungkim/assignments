class MathDojo(object):
	def __init__(self):
		self.value = 0
	def add(self, plus=0, *rest):
		# isinstance(plus, list) -> checks if input is list (array) or not
		if isinstance(plus, list) or isinstance(plus, tuple):
			for i in range(0, len(plus)):
				self.value += plus[i]
		else:
			self.value += plus
		for j in range(0, len(rest)):
			if isinstance(rest[j], list) or isinstance(rest[j], tuple):
				for k in range(0, len(rest[j])):
					self.value += rest[j][k]
			else:
				self.value += rest[j]
		return self
	def subtract(self, minus=0, *rest):
		if isinstance(minus, list) or isinstance(minus, tuple):
			for i in range(0, len(minus)):
				self.value -= minus[i]
		else:
			self.value -= minus
		for j in range(0, len(rest)):
			if isinstance(rest[j], list) or isinstance(rest[j], tuple):
				for k in range(0, len(rest[j])):
					self.value -= rest[j][k]
			else:
				self.value -= rest[j]
		return self
	def result(self):
		print self.value
		return self
		
MathDojo().add((1,1),[1,1],[3,2,1],3,4,1).subtract([1],[2,1],(3,1)).result()
