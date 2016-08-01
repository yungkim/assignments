// Assignment: Be the Interpreter
// To understand and write JavaScript code effectively, you need to understand how the interpreter rearranges your code. For each of the following problems rewrite the code to mimic how the interpreter would rearrange it before running. After rearranging the code, predict the output.

// Example Problem:
// var hello = "interesting";
// function example() {
//   var hello = "hi!";
//   console.log(hello);
// }
// example();
// console.log(hello);
// Answer:
// //declarations get hoisted
// var hello;                 
// function example() {       
//   var hello;               
//   hello = "hi";            
//   console.log(hello)       
// }
// //assignments and invocation maintain order
// hello = "interesting";     
// example();                        
// console.log(hello);
// Do the same thing with the following 3 problems. Once you’re done, run the code to make sure your predictions are correct and upload your file.

// Problem 1:
// console.log(first_variable);
// var first_variable = "Yipee I was first!";
// function firstFunc() {
//   first_variable = "Not anymore!!!";
//   console.log(first_variable)
// }
// console.log(first_variable);
// Problem 2:
// var food = "Chicken";
// function eat() {
//   food = "half-chicken";
//   console.log(food);
//   var food = "gone";       // CAREFUL!
//   console.log(food);
// }
// eat();
// console.log(food);
// Problem 3:
// var new_word = "NEW!";
// function lastFunc() {
//   new_word = "old";
// }
// console.log(new_word);
// One of the best things you can do with an assignment like this is to discuss it with your compatriots. Nailing these hoisting concepts will save you from a world of painful bugs as your applications grow in complexity.
var first_variable = "Yipee I was first!";
console.log(first_variable);
firstFunc()
function firstFunc() {
  first_variable = "Not anymore!!!";
  console.log(first_variable)
}

var food = "Chicken";
console.log(food);
function eat() {
  food = "half-chicken";
  console.log(food);
  var food = "gone";       // CAREFUL!
  console.log(food);
}
eat();

var new_word = "NEW!";
function lastFunc() {
  new_word = "old";
  console.log(new_word);
}
console.log(new_word);
lastFunc()

// [nodemon] starting `node main.js`
// Yipee I was first!
// Not anymore!!!
// Chicken
// half-chicken
// gone
// NEW!
// old
// [nodemon] clean exit - waiting for changes before restart
