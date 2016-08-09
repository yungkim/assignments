var mongoose = require('mongoose');
var Person = mongoose.model('Person');
module.exports = {
  show: function(req, res) {
    Person.find({}, function(err, people) {
      // res.render('index', {people: people});
      res.json({people: people})
    })
  },
  create: function(req, res) {
    var person = new Person({name: req.params.name});
    person.save(function(err) {
      if(err){
        console.log("something went wrong");
      } else {
        res.redirect('/');
      }
    })
  },
  destroy: function(req, res) {
    Person.remove({name: req.params.name}, function(err){
        res.redirect('/');
    });
  },
  show_one: function(req, res) {
    Person.find({name: req.params.name}, function(err, person) {
        res.json({person: person})
    });
  },
}