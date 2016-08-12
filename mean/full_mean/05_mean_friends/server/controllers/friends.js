console.log('>>> controllers/friends.js');

var mongoose = require('mongoose');
var Friend = mongoose.model('Friend');

// Build out the methods in the friendsControllers below
function FriendsController() {
  console.log('>>> controllers/friends.js, FriendsController()');
  this.index = function(req,res) {
    console.log('>>> controllers/friends.js, FriendsController().index');
    Friend.find({}, function(err, data) {
      if (err) {console.log(err);}
        res.json({data: data});
      });
    };
  this.create = function(req,res) {
    console.log('>>> controllers/friends.js, FriendsController().create');
    var friend = new Friend(req.body);
    friend.save();
  };
  this.update = function(req,res) {
    console.log('>>> controllers/friends.js, FriendsController().update');
    Friend.findOne({_id: req.body._id}, function(err, friend) {
      friend.firstName = req.body.firstName,
      friend.lastName = req.body.lastName,
      friend.birthday = req.body.birthday
      // console.log(friend);
      friend.save(function(err) {
        if(err) { console.log(err); }
        res.json(friend);
      })
    })
  };
  this.delete = function(req,res) {
    console.log('>>> controllers/friends.js, FriendsController().delete');
    Friend.remove({_id: req.params.id}, function(err, data) {
      if(err) { console.log(err); }
      res.json("hello");
    })
  };
  this.show = function(req,res) {
    console.log('>>> controllers/friends.js, FriendsController().show');
    Friend.find({_id: req.params.id}, function(err, data) {
      if (err) { console.log(err); }
      res.json({data: data});
    });
  };
}
module.exports = new FriendsController(); // what does this export?