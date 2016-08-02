// Assignment: Creating Objects II
// MandatoryDeadline: Tuesday of Week 1Difficulty Level: BasicEstimated Time: 1-2 hrs
// Modify your VehicleConstructor (from earlier) to use this & new (and follow the JS conventions talked about in the previous chapters). To recap, here were the requirements from Part I:

// Create a vehicleConstructor that takes in the name, number of wheels, and number of passengers
// Each vehicle should have a makeNoise method
// Using the constructor, create a Bike
// redefine the Bike’s makeNoise method to print “ring ring!”
// Using the constructor, create a Sedan
// redefine the Sedan’s makeNoise method to print “Honk Honk!”
// Using the constructor, create a Bus
// Give the bus a pickUpPassengers method that takes in the number of passengers to pick up and adds them to the passenger count 
// Then make the following modifications:

// Have the Vehicle constructor also take in a “speed”
// Store the speed as an attribute
// Create a private variable called distance_travelled that starts at 0
// Create a private method called updateDistanceTravelled that increments distance travelled by speed
// Add a method to the Vehicle called “move” that calls updateDistanceTravelled and then makeNoise
// Add a method called checkMiles that console.logs the distance_travelled
// Bonus: Use ES6 Class!
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes

// Note: Making truly (or almost truly) private vars using ES6 classes is rather advanced at this point in your JS development career.

// ES6

class Vehicle {
    constructor(name, numberOfWheels, numberOfPassengers, speed) {
        this.name = name
        this.numberOfWheels = numberOfWheels
        this.numberOfPassengers = numberOfPassengers
        this.speed = speed
        this.distanceTravelled = 0
    }
    makeNoise() {
        console.log("Noise!")
    }
    updateDistanceTravelled() {
        this.distanceTravelled += this.speed;
        console.log(this.distanceTravelled)
    }
    move() {
        this.updateDistanceTravelled()
        this.makeNoise()
    }
    checkMiles() {
        console.log(this.distanceTravelled)
    }

}

const bike = new Vehicle("Bicycle", 2, 1, 20);
console.log(bike.name);
bike.makeNoise()
bike.makeNoise = function() {
    console.log("Ring Ring!")
}
bike.makeNoise()

const sedan = new Vehicle("Sedan", 4, 5, 60);
sedan.makeNoise = function() {
    console.log("Honk Honk!")
}
sedan.makeNoise()

const bus = new Vehicle("School Bus", 4, 20, 40);
bus.pickUpPassengers = function() {
    var count = this.numberOfPassengers
    console.log("Picked up " + count + " people")
}
bus.pickUpPassengers()

let car = new Vehicle("Ferrari", 4, 4, 100);
car.updateDistanceTravelled()
car.move()
car.checkMiles()

// [nodemon] starting `node main.js`
// Bicycle
// Noise!
// Ring Ring!
// Honk Honk!
// Picked up 20 people
// 100
// 200
// Noise!
// 200
// [nodemon] clean exit - waiting for changes before restart