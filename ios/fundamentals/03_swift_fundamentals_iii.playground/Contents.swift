// Swift Fundamentals III

// Write a program that adds the numbers 1-255 to an array
var array = [Int]()
for i in 1...255 {
    array.append(i)
}
print(array)

// Swap two random values in the array
// Hint: you can use the arc4random_uniform(UInt32) function to get a random number from 0 to the number passed in. The arc4random_uniform function takes in one parameter that is of the UInt32 type and returns a random number that is of the UInt32 type. How can you deal with this using your knowledge of types?
import Foundation //imports random number function
var random1 = Int(arc4random_uniform(UInt32(100)))
var random2 = Int(arc4random_uniform(UInt32(100)))
swap(&array[random1], &array[random2])
print(array)

// Now write the code that swaps random values 100 times (You've created a "Shuffle"!)
for i in 1...100 {
    var rand1 = Int(arc4random_uniform(UInt32(100)))
    var rand2 = Int(arc4random_uniform(UInt32(100)))
    var temp = array[rand1]
    array[rand1] = array[rand2]
    array[rand2] = temp
}
print(array)

//Remove the value "42" from the array and Print "We found the answer to the Ultimate Question of Life, the Universe, and Everything at index __" and print the index of where "42" was before you removed it.
var found_idx = 0
for idx in 0..<array.count {
    if array[idx] == 42 {
        found_idx = idx
        array.removeAtIndex(found_idx)
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(found_idx)")
        break
    }
}
print(array)