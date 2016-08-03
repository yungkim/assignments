// Assignment: Creating Objects III
// MandatoryDeadline: Tuesday of Week 1Difficulty Level: BasicEstimated Time: 1-2 hrs
// Modify your Vehicle Class to take advantage of Prototypes!

// To recap, here is what we did in Parts I & II:

// Create a VehicleConstructor that takes in the name, number of wheels, and number of passengers

// Each vehicle should have a makeNoise method
// Using the constructor, create a Bike
// redefine the Bike’s makeNoise method to print “ring ring!” Using the constructor, create a Sedan
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
// Now modify your code to use Prototype and the recommended way of OOP we showed in the previous chapter.

// You may have to change some private variables/methods to attributes to make all of the functionality work.

// Then make the following additions:

// Have each vehicle generate a random VIN number (study Math.random & Math.floor). Don’t worry about potential duplicates for now.

// ES6

class Vehicle {
    constructor(name, numberOfWheels, numberOfPassengers, speed) {
        
        var chars = "0123456789ABCEDGHIJKLMNOPQRSTUVWXYZ";

        this.name = name
        this.numberOfWheels = numberOfWheels
        this.numberOfPassengers = numberOfPassengers
        this.speed = speed
        this.distanceTraveled = 0
        this.vin = createVin()
        function createVin(){
            var vin = '';
            for (var i = 0; i < 17; i+=1 ){
              // Use Math.floor and Math.random to generate random index to access character from char string
              vin += chars[Math.floor(Math.random()*35)];
            }
            return vin;
          }
    }

}
Vehicle.prototype.makeNoise = function(noise){
  var noise = noise || "Noise!";
  console.log(noise);
  return this;
};


Vehicle.prototype.move = function(){
  this.makeNoise();
  this.updateDistanceTraveled();
  return this;
};

Vehicle.prototype.checkMiles = function(){
  console.log(this.distanceTraveled);
  return this;
};

Vehicle.prototype.updateDistanceTraveled = function(){
  this.distanceTraveled += this.speed;
  console.log(this.distanceTraveled);
  return this;
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
car.updateDistanceTraveled()
car.move()
car.checkMiles()
console.log(car.vin)

// [nodemon] starting `node main.js`
// Bicycle
// Noise!
// Ring Ring!
// Honk Honk!
// Picked up 20 people
// 100
// Noise!
// 200
// 200
// Q3ZJ6SS009141U7NX
// [nodemon] clean exit - waiting for changes before restart