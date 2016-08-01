// Assignment: Build Some Functions!
// You’ll need a JavaScript file, so go ahead and create one.

// Complete the tasks listed below.
// Some advice:
// As you and your classmates work on this assignment, different people will invariably produce different and interesting bugs. These are like gold – tackling them and understanding why they occurred will only make you a better developer and set the stage for success in the MEAN stack. That’s a long-winded way of saying: If you run into a difficult bug, be generous and invite some of your classmates over to debug with you.
//  Basic: Make a function that can be used anywhere in your file and that when invoked will console.log('I am running!'); Give it the name runningLogger.
//  Basic: Make a function that is callable, has one parameter and multiplies the value of the parameter by 10 before returning the result. Give it the name multiplyByTen. Invoke it, passing it the argument 5.
//  Basic: Write two functions (stringReturnOne and stringReturnTwo) that each return a different hard-coded string
//  Medium: Write a function named caller that has one parameter. If the argument provided to caller is a function (typeof may be useful), invoke the argument. Nothing is returned.
//  Medium: Write a function named myDoubleConsoleLog that has two parameters, if the arguments passed to the function are functions, console.log the value that each, when invoked, returns.
//  Hard: Write a function named caller2 that has one parameter. It console.log's the string 'starting', waits 2 seconds, and then invokes the argument if the argument is a function. (setTimeout may be useful for this one.) The function should then console.log ‘ending?’ and return “interesting”. Invoke this function by passing it myDoubleConsoleLog.



function runningLogger() {
    console.log('I am running!');
}
runningLogger()

function multiplyByTen(value) {
    value = value * 10
    return value
}
var result = multiplyByTen(5)
console.log(result)

function stringReturnOne() {
    console.log("One")
    return "One"
}
function stringReturnTwo() {
    console.log("Two")
    return "Two"
}
console.log(stringReturnOne())
console.log(stringReturnTwo())

function caller(arg) {
    if (typeof(arg) == "function" ) {
        console.log("It's a function")
        arg()
    }
}
caller(stringReturnTwo)

function myDoubleConsoleLog(arg1, arg2) {
     if (typeof(arg1) == "function" ) {
        console.log("It's a function one")
        console.log(arg1())
    }
     if (typeof(arg2) == "function" ) {
        console.log("It's a function two")
        console.log(arg2())
    }
}
myDoubleConsoleLog(stringReturnOne, stringReturnTwo)

function caller2(arg) {
    console.log("starting")
    setTimeout(function(){
        if (typeof(arg) == "function" ) {
            console.log("It's a function")
            arg()
            console.log("ending?")
        }
    }, 3000);
    console.log("interesting")
    return "interesting"
}
console.log(caller2(myDoubleConsoleLog))

// [nodemon] starting `node main.js`
// I am running!
// 50
// One
// One
// Two
// Two
// It's a function
// Two
// It's a function one
// One
// One
// It's a function two
// Two
// Two
// starting
// interesting
// interesting
// It's a function
// ending?
// [nodemon] clean exit - waiting for changes before restart