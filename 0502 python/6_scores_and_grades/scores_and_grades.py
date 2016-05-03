score = [87, 67, 95, 100, 75, 90, 89, 72, 60, 98]
grade = ""
print "Scores and Grades"
for i in range(0,len(score)):
	if score[i] >= 90:
		grade = "A"
	elif score[i] >= 80:
		grade = "B"
	elif score[i] >= 70:
		grade = "C"
	elif score[i] >= 60:
		grade = "D"
	else:
		grade = "F"
	print "Score: " + str(score[i]) + "; Your grade is " + grade