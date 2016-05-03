import random

my_random=[]

for i in range(100):
	my_random.append(random.randrange(1,10001,1))   # Even integer from 0 to 100
print 'Original array = ',my_random


for k in range(100):
	for j in range(1,len(my_random)-k):
		if my_random[j]<my_random[j-1]:
			my_random[j], my_random[j-1] = my_random[j-1], my_random[j]
	k+=1

print 'Sorted array = ',my_random