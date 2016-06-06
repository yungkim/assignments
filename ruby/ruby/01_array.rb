array = [1, 2, 3, 4, 5]
print "Array.at = ", array.at(1), "\n" # Array.at = 2
print "Array.fetch = ",array.fetch(1), "\n" # Array.fetch = 2
array.delete(2)
print "Array.delete = ", array, "\n" # Array.delete = [1, 3, 4, 5]
print "Array.reverse = ", array.reverse, "\n" # Array.reverse = [5, 4, 3, 1]
print "Array.length = ",array.length, "\n" # Array.length = 4

array2 = [4, 7, 2, 7, 8, 0]
print "Array2.sort = ", array2.sort, "\n" # Array2.sort = [0, 2, 4, 7, 7, 8]
print "Array2.slice = ", array2.slice(0..2), "\n" # Array2.slice = [4, 7, 2]
print "Array2.shuffle = ", array2.shuffle, "\n" # Array2.suffle = [randomly sorted numbers]
print "Array2.join = ", array2.join, "\n" # Array2.join = 472780
print "Array2.insert = ", array2.insert(0, 99), "\n" # Array2.insert = [99, 4, 7, 2, 7, 8, 0]
print "Array2.values_at = ", array2.values_at(0, 3, 5), "\n" # Array2.values_at = [99, 2, 8]