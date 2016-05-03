#Part I
#Create a program that prints all the odd numbers from 1 to 1000. Use the for loop and don't use any array to do this exercise.
for i in range(1,1001):
	if i % 2 == 1:
		print i
	i += 1

#Part II
#Create another program that prints all the multiples of 5 from 5 to 1,000,000. 
for j in range(5, 1000001):
	if j % 5 == 0:
		print j
	j += 1