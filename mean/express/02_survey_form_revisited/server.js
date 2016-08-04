var express = require("express");
var path = require("path");
var app = express();

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded());

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

var server = app.listen(8000, function() {
  console.log("listening on port 8000");
})

// this is a new line we're adding AFTER our server listener
// take special note how we're passing the server
// variable. unless we have the server variable, this line will not work!!
var io = require('socket.io').listen(server)

// Whenever a connection event happens (the connection event is built in) run the following code
io.sockets.on('connection', function (socket) {
    console.log("WE ARE USING SOCKETS!");
    console.log(socket.id);
    socket.on("posting_form", function (data){
        var querystring = require('querystring');
        var result = querystring.parse(data.input);
        console.log(result)
        var luckyNumber = Math.floor(Math.random() * 1000) + 1
        socket.emit('server_response', {response: result, luckyNumber: luckyNumber});
    })
})


