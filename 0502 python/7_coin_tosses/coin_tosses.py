import random
# the random function will return a floating point number,
# that is 0.0 <= random_num < 1.0

# x = .23945593
# y = .798839238
# x_rounded = round(x)
# x_rounded will be rounded down to 0
# y_rounded = round(y)
# y_rounded will be rounded up to 1

head = 0
tail = 0
current_coin = ""
for i in range(1,101):
	random_num = random.random()
	if round(random_num) == 1:
		head += 1
		current_coin = "head"
	elif round(random_num) == 0:
		tail += 1
		current_coin = "tail"
	print "Attempt #" + str(i) + ": Throwing a coin... It's a " + current_coin + "! ... Got " + str(head) + " head(s) so far and " + str(tail) + " tails(s) so far"
print "Ending the program, thank you!"
