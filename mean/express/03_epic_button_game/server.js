// For this assignment, build the app described in the mockup below using Express and sockets.  Your app should serve only a single view, index.ejs.  Any time the epic button is pushed, the count should update on every user who is connected via sockets.  This should happen in real time.  If a user clicks the reset button, the count should reset to 0 for every user as well!
// Think about the events the client will need to listen for and the events the server must listen for.  Map out the emitters and listeners you will need before you start coding.  Use a variable on the server to keep track of how many times the button has been clicked. 

// require express,path and body-parser
var express = require("express");
var path = require("path");
var bodyParser = require('body-parser');
var app = express();

app.use(bodyParser.urlencoded());
// static content 
app.use(express.static(path.join(__dirname, "./static")));
// setting up ejs and our views folder
app.set('views', path.join(__dirname, './views'));
app.set('view engine', 'ejs');

// tell the express app to listen on port 8000
var server = app.listen(8000, function() {
    console.log("listening on port 8000");
})

// load the routes file, pass app and server into it (for handling url visits and events)
var route = require('./routes/index.js')(app, server);