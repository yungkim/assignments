# Part I

# Create a program that outputs:

# Michael Jordan
# John Rosales
# Mark Guillen
# KB Tonel

students = [ 
    {'first_name':  'Michael', 'last_name' : 'Jordan'},
    {'first_name' : 'John', 'last_name' : 'Rosales'},
    {'first_name' : 'Mark', 'last_name' : 'Guillen'},
    {'first_name' : 'KB', 'last_name' : 'Tonel'}
]
for i in range(0,len(students)):
	print students[i]['first_name'],students[i]['last_name']

# Part II

# Create a program that prints  the following format (including number of characters in each combined name):

# Students
# 1 - MICHAEL JORDAN - 13
# 2 - JOHN ROSALES - 11
# 3 - MARK GUILLEN - 11
# 4 - KB TONEL - 7
# Instructors
# 1 - MICHAEL CHOI - 11
# 2 - MARTIN PURYEAR - 13
users = {
 'Students': [ 
    {'first_name':  'Michael', 'last_name' : 'Jordan'},
    {'first_name' : 'John', 'last_name' : 'Rosales'},
    {'first_name' : 'Mark', 'last_name' : 'Guillen'},
    {'first_name' : 'KB', 'last_name' : 'Tonel'}
  ],
 'Instructors': [
    {'first_name' : 'Michael', 'last_name' : 'Choi'},
    {'first_name' : 'Martin', 'last_name' : 'Puryear'}
  ]
 }

print "\nStudents"
for j in range(0,len(users['Students'])):
	name_len = len(users['Students'][j]['first_name'])+len(users['Students'][j]['last_name'])
	print j+1,'-',users['Students'][j]['first_name'],users['Students'][j]['last_name'],'-',name_len
print "Instructors"
for k in range(0,len(users['Instructors'])):
	name_len = len(users['Instructors'][k]['first_name'])+len(users['Instructors'][k]['last_name'])
	print k+1,'-',users['Instructors'][k]['first_name'],users['Instructors'][k]['last_name'],'-',name_len