// require mongoose
var mongoose = require('mongoose');
// create the schema
var DogSchema = new mongoose.Schema({
    name: String,
    breed: String,
    color: String
});
// register the schema as a model
var Dog = mongoose.model('Dog', DogSchema); // We are setting this Schema in our Models as 'Dog'
