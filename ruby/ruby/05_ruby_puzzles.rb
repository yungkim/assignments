print "Array = ", array = [3,5,1,2,7,9,8,13,25,32], "\n"
print "\tSum = ", array.inject(0) { |sum,x| sum + x }, "\n"
print "\tNumbers greater than 10 = ", array.reject { |a| a <=10 }, "\n\n"

print "Names = ", names = ["John", "KB", "Oliver", "Cory", "Matthew", "Christoper"], "\n"
print "\tShuffled name list = ", names.shuffle, "\n"
print "\tNames longer than 5 characters = ", names.reject { |a| a.length <= 5 }, "\n\n"

print "Alphabets = ", alphabets = ("a".."z").to_a, "\n"
shuffled = alphabets.shuffle; print "\tLast chracter of shuffled alphabets = ", shuffled.last, "\n"
print "\tIs first character '#{shuffled.first}' a vowel? ", shuffled.first.scan(/[aeoui]/).any? { |a| a.length != 0}, "\n\n"

print "10 random numbers = ", random = (1..10).map{rand(55..100)}, "\n"
print "\t10 random numbers sorted = ", random.sort, "\n"
print "\tLargest is ", random.max, ", smallest is ", random.min, ".\n\n"

def five_char
    five_char=""
    for i in 0..4
        five_char +=  (65+rand(26)).chr
    end
    return five_char
end
print "Random string 5 characters long = ", five_char(), "\n"
result=[]
for i in 0..9
    result.push(five_char)
end
print "\t10 random strings that are 5 characters long = ", result

# Array = [3, 5, 1, 2, 7, 9, 8, 13, 25, 32]
#     Sum = 105
#     Numbers greater than 10 = [13, 25, 32]

# Names = ["John", "KB", "Oliver", "Cory", "Matthew", "Christoper"]
#     Shuffled name list = ["Cory", "Christoper", "KB", "Oliver", "John", "Matthew"]
#     Names longer than 5 characters = ["Oliver", "Matthew", "Christoper"]

# Alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
#     Last chracter of shuffled alphabets = b
#     Is first character 'x' a vowel? false

# 10 random numbers = [76, 82, 96, 98, 100, 70, 77, 60, 71, 64]
#     10 random numbers sorted = [60, 64, 70, 71, 76, 77, 82, 96, 98, 100]
#     Largest is 100, smallest is 60.

# Random string 5 characters long = VVZTM
#     10 random strings that are 5 characters long = ["BNYBC", "TRJMC", "KZJZF", "CXSTB", "RFSQH", "EYUGQ", "FOQNV", "ZMOEI", "XABZE", "UWBFY"]