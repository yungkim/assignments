var mongoose = require('mongoose'); // Require the Mongoose
var express = require('express'); // Require the Express Module
var app = express(); // Create an Express App
var bodyParser = require('body-parser'); // Require body-parser (to receive post data from clients)
app.use(bodyParser.urlencoded({ extended: true })); // Integrate body-parser with our App
var path = require('path'); // Require path

// require the mongoose configuration file which does the rest for us
require('./server/config/mongoose.js');

app.use(express.static(path.join(__dirname, './client/static'))); // Setting our Static Folder Directory
app.set('views', path.join(__dirname, './client/views')); // Setting our Views Folder Directory
app.set('view engine', 'ejs'); // Setting our View Engine set to EJS

// store the function in a variable
var routes_setter = require('./server/config/routes.js');
// invoke the function stored in routes_setter and pass it the "app" variable
routes_setter(app);

// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
});