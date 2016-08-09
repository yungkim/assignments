var mongoose = require('mongoose');
var Dog = mongoose.model('Dog');
module.exports = {
  show: function(req, res) {
    Dog.find({}, function(err, dogs) {
      res.render('index', {dogs: dogs});
    })
  },
  create: function(req, res) {
    var dog = new Dog({name: req.body.name, breed: req.body.breed, color: req.body.color});
    dog.save(function(err) {
      if(err){
        console.log("something went wrong");
      } else {
        res.redirect('/');
      }
    })
  },
  edit: function(req, res) {
    Dog.find({_id: req.params.id}, function(err, dog) {
        res.render('edit', { results: dog[0]});
    });
  },
  show_one: function(req, res) {
    Dog.find({_id: req.params.id}, function(err, dog) {
        res.render('dog', { results: dog[0]});
    });
  },
  update: function(req, res) {
    Dog.update({ _id: req.params.id }, req.body, function(err, result){
        if (err) { console.log(err); };
        res.redirect('/');
    });
  },
  destroy: function(req, res) {
    Dog.remove({_id: req.params.id }, function(err){
        res.redirect('/');
    });
  },
}