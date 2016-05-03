# Part 1
# Create a function called  draw_stars() that takes a list of numbers and prints out  *.

# For example:

# x = [4, 6, 1, 3, 5, 7, 25]
# draw_stars(x) should print the following in when invoked:

# **** 
# ****** 
# * 
# *** 
# ***** 
# ******* 
# *************************
x = [4, 6, 1, 3, 5, 7, 25]

def draw_stars(arr):
	print "array = ",arr
	for i in range(0,len(arr)):
		star_result = ""
		for item in range(0,x[i]):
			star_result += "*"
		print star_result

draw_stars(x)


# Part 2
# Modify the function above. Allow a list containing integers and strings to be passed to the  draw_stars() function. When a string is passed, instead of  displaying *, display the first letter of the string according to the example below. You may use the .lower() string method for this part.

# For example:

#  x = [4, "Tom", 1, "Michael", 5, 7, "Jimmy Smith"]
# draw_stars(x) should print the following in the terminal:

# **** 
# ttt 
# * 
# mmmmmmm 
# ***** 
# ******* 
# jjjjjjjjjjj
y = [4, "Tom", 1, "Michael", 5, 7, "Jimmy Smith"]
# y = [41, 16, 1, 3, 5, 7, 25]

def draw_stars2(arr):
	print "array = ",arr
	for i in range(0,len(arr)):
		if isinstance(arr[i], str) == False:
			arr[i] = "*" * arr[i]
		else:
			arr[i] = arr[i][0].lower() * len(arr[i])
		print arr[i]

draw_stars2(y)