// Load the express module (Where do you think this comes from?)
var express = require("express");
// invoke var express and store the resulting application in var app
var app = express();
// This sets the location where express will look for the ejs views
app.set('views', __dirname + '/views'); 
// Now lets set the view engine itself so that express knows that we are using ejs as opposed to another templating engine like jade
app.set('view engine', 'ejs');

// require body-parser
var bodyParser = require('body-parser');
// use it!
app.use(bodyParser.urlencoded());

// this is the line that tells our server to use the "/static" folder for static content
// app.use(express.static(__dirname + "/static"));

app.get("/", function (request, response){
    response.render('index');
})

app.post("/result", function (request, response){
    if (request.body.name == '') {
        response.redirect('/')
    }
    response.render('results', { results: request.body });
    console.log("POST DATA \n\n", request.body)
})


// Tell the express app to listen on port 8000
app.listen(8000, function() {
  console.log("listening on port 8000");
})
// this line will almost always be at the end of your server.js file (we only tell the server to listen after we have set up all of our rules)