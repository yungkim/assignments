// Assignment: Creating Objects I
// MandatoryDeadline: Tuesday of Week 1Difficulty Level: BasicEstimated Time: 1-2 hrs
// We are going to create our very own constructor. Create a VehicleConstructor that takes in the name, number of wheels, and number of passengers. Then complete the following tasks:
//  Each vehicle should have a makeNoise method
//  Using the constructor, create a Bike
//  Redefine the Bike’s makeNoise method to print “ring ring!”
//  Create a Sedan
//  Redefine the Sedan’s makeNoise method to print “Honk Honk!”
//  Using the constructor, create a Bus
//  Add a method to Bus that takes in the number of passengers to pick up and adds them to the passenger count​

function VehicleConstructor(name, numberOfWheels, numberOfPassengers){
    var vehicle = {};

    vehicle.name = name;
    vehicle.numberOfWheels = numberOfWheels;
    vehicle.numberOfPassengers = numberOfPassengers;
    
    vehicle.makeNoise = function() {
        console.log("Noise!")
    }

    return vehicle;
}

var bike = VehicleConstructor("Bike", 2, 2)
console.log(bike)
bike.makeNoise = function() {
    console.log("Ring Ring!")
}
bike.makeNoise();

var sedan = VehicleConstructor("Sedan", 4, 5)
sedan.makeNoise = function() {
    console.log("Honk Honk!")
}
sedan.makeNoise()

var bus = VehicleConstructor("Bus", 4, 20)
bus.pickUpCount = function(numberOfPassengersToPickUp) {
    var count = numberOfPassengersToPickUp
    if (count <= this.numberOfPassengers) {
        console.log("Bus picked up " + count + " people")
    } else { console.log("Sorry, bus is full!")}
}

bus.pickUpCount(5)