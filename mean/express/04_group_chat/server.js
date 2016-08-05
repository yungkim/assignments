var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var app = express();

app.use(express.static(path.join(__dirname, "./static")));
app.use(bodyParser.urlencoded({extended: true}));
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

var server = app.listen(8000, function() {
  console.log("listening on port 8000");
})

// load the routes file, pass app and server into it (for handling url visits and events)
var route = require('./routes/index.js')(app, server);