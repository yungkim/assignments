// Assignment IV: Math Module
// MandatoryDeadline: Friday of Week 1Difficulty Level: IntermediateEstimated Time: 3-6 hrs
// For this exercise, create a javascript file called 'mathlib.js'.  We're not going to make a node server for this exercise, but we'll still make a file called app.js.  Within app.js, we're going to require our mathlib module and use its functionality to do some basic computations.

// In this javascript module, you're going to return a javascript object that allows the developer to do the following tricks.

// add two numbers (e.g. math.add(2,3) should return 5)
// multiply two numbers (e.g. math.multiply(3,5) should return 15)
// square a number (e.g. math.square(5) should return 25)
// returns a random number between the two numbers (e.g. math.random(1,35) should return a random number between 1 and 35)
// Now there are a few different ways to do this, but the way we would recommend you structure your 'mathlib.js' is to do something like below:

module.exports = function (){
  return {
    add: function(num1, num2) { 
         console.log("the sum is:", num1 + num2);
       },
    multiply: function(num1, num2) {
         console.log("the result is:", num1 * num2);
       },
    square: function(num) {
         console.log("the result is:", num * num);
    },
    random: function(num1, num2) {
         console.log("the result is:", Math.floor((Math.random(num1, num2) * 10))+1);
    }
  }
};