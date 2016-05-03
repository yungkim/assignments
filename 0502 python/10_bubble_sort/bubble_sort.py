import random
import datetime

my_random=[]

now1 = datetime.datetime.now()
print '\n',now1
for i in range(100):
	my_random.append(random.randrange(1,10001,1))   # Even integer from 0 to 100
print 'Original array = ',my_random
now2 = datetime.datetime.now()
print now2
print 'Time took to create an original array: ',(now2-now1).total_seconds()

now3 = datetime.datetime.now()
print '\n',now3
for k in range(100):
	for j in range(1,len(my_random)-k):
		if my_random[j]<my_random[j-1]:
			my_random[j], my_random[j-1] = my_random[j-1], my_random[j]
	k+=1

print 'Sorted array = ',my_random
now4 = datetime.datetime.now()
print now4
print 'Time took to sort an array: ',(now4-now3).total_seconds()