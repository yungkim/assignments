even_odd = "even"
for i in range(0, 2001):
	if i % 2 == 0:
		even_odd = "even"
	elif i % 2 == 1:
		even_odd = "odd"
	print "Number is " +  str(i) + ". This is an " + even_odd + " number" # cannot concatenate 'str' and 'int' objects