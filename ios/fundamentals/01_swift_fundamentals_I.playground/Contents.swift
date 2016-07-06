let type: String = "Rectangle"
let description: String = "A quadrilateral with four right angles"

var width: Double = 5
var height: Double = 10.5
var area = width * height

height += 1
width += 1

area = width * height
// Note how you can "interpolate" variables into Strings using the following syntax
print("The shape is a \(type) or \(description) with an area of \(area)")


print("The maximum value \(Int.max)")
print("The minimum value \(Int.min)")

print("The maximum value \(Int32.max)")
print("The minimum value \(Int32.min)")

print("The maximum value \(UInt32.max)")
print("The minimum value \(UInt32.min)")

print("Addition \(1 + 3)")
print("Subtraction \(1 - 3)")
print("Multiplication \(1 * 3)")
print("Division \(1.0 / 3.0)")

// loop from 1 to 5 including 5
for i in 1...5 {
    print(i)
}
// loop from 1 to 5 excluding 5
for i in 1..<5 {
    print(i)
}

var i = 1
while i < 6 {
    print(i)
    i = i+1
}