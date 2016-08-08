var mongoose = require('mongoose'); // Require the Mongoose
var express = require('express'); // Require the Express Module
var app = express(); // Create an Express App
var bodyParser = require('body-parser'); // Require body-parser (to receive post data from clients)
app.use(bodyParser.urlencoded({ extended: true })); // Integrate body-parser with our App
var path = require('path'); // Require path


// This is how we connect to the mongodb database using mongoose -- "mongoose_dashboard" is the name of
//   our db in mongodb -- this should match the name of the db you are going to use for your project.
mongoose.connect('mongodb://localhost/mongoose_dashboard');

var DogSchema = new mongoose.Schema({
 name: String,
 breed: String,
 color: String
});
mongoose.model('Dog', DogSchema); // We are setting this Schema in our Models as 'Dog'
var Dog = mongoose.model('Dog'); // We are retrieving this Schema from our Models, named 'Dog'





app.use(express.static(path.join(__dirname, './static'))); // Setting our Static Folder Directory
app.set('views', path.join(__dirname, './views')); // Setting our Views Folder Directory
app.set('view engine', 'ejs'); // Setting our View Engine set to EJS

// Routes

// app.get('/', function(req, res) {
//     // This is where we will retrieve the dogs from the database and include them in the view page we will be rendering.
//     res.render('index');
// })
app.get('/', function(req, res) {
  Dog.find({}, function(err, dogs) {
    // This is the method that finds all of the dogs from the database
    // Notice how the first parameter is the options for what to find and the second is the
    //   callback function that has an error (if any) and all of the dogs
    // Keep in mind that everything you want to do AFTER you get the dogs from the database must
    //   happen inside of this callback for it to be synchronous 
    // Make sure you handle the case when there is an error, as well as the case when there is no error
    console.log(dogs);
    res.render('index', { results: dogs});
  });
});

app.get('/dogs/new', function(req, res) {
    res.render('new');
});

app.post('/dogs', function(req, res) {
  console.log("POST DATA", req.body);
  // create a new Dog with the name, breed and color corresponding to those from req.body
  var dog = new Dog({name: req.body.name, breed: req.body.breed, color: req.body.color});
  // Try to save that new dog to the database (this is the method that actually inserts into the db) and run a callback function with an error (if any) from the operation.
  dog.save(function(err) {
    // if there is an error console.log that something went wrong!
    if(err) {
      console.log('something went wrong');
    } else { // else console.log that we did well and then redirect to the root route
      console.log('successfully added a dog!');
      res.redirect('/');
    };
  });
})

app.get('/dogs/:id', function(req, res) {
    // ...retrieve all records matching {name:'Jessica'}
    Dog.find({_id: req.params.id}, function(err, dog) {
     // Retrieve an array of users matching the name. Even if 1 record is found, the result will be an array the size of 1, with 1 object inside. (Notice, if we are expecting to retrieve one record, we may want to use findOne and retrieve the object as oppose to an array the size of one.
     // This code will run when the DB is done attempting to retrieve all matching records to {_id: req.params.id}
     res.render('dog', { results: dog[0]});
    });
});

app.get('/dogs/:id/edit', function(req, res) {
    // ...retrieve all records matching {name:'Jessica'}
    Dog.find({_id: req.params.id}, function(err, dog) {
     // Retrieve an array of users matching the name. Even if 1 record is found, the result will be an array the size of 1, with 1 object inside. (Notice, if we are expecting to retrieve one record, we may want to use findOne and retrieve the object as oppose to an array the size of one.
     // This code will run when the DB is done attempting to retrieve all matching records to {_id: req.params.id}
     res.render('edit', { results: dog[0]});
    });
});

app.post('/dogs/:id', function(req, res) {
    Dog.update({ _id: req.params.id }, req.body, function(err, result){
    if (err) { console.log(err); };
    res.redirect('/');
    });
});

app.post('/dogs/:id/destroy', function(req, res) {
    Dog.remove({_id: req.params.id }, function(err){
    // This code will run when the DB has attempted to remove all matching records to {_id: 'insert record unique id here'}
    res.redirect('/');
    });
});

// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
});