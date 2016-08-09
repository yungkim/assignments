var mongoose = require('mongoose');
// create the schema
var PersonSchema = new mongoose.Schema({
    name: String
});
// register the schema as a model
var Person = mongoose.model('Person', PersonSchema); 
// We are setting this Schema in our Models as 'Person'