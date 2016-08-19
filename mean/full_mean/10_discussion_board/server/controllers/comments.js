const mongoose = require('mongoose')
const Comment = mongoose.model('Comment')
const User = mongoose.model('User')
const Answer = mongoose.model('Answer')

module.exports = (function() {
  return {

    create: function(req, res){
    Comment.create({
      text : req.body.text,
      _answer : req.body._answer,
      _user : req.body._user
    }, function(err, comment) {
      if (err) return res.send(err);
      console.log('what is comment', comment)
      User.update({ _id : comment._user }, { $push : { _comments : comment._id } },function(err, updatedUser) {
        Answer.update({ _id : comment._answer }, { $push : { _comments : comment._id } },function(err, updatedTopic) {
          res.send(comment);
        });
      });
    });
    },

    show: function(req, res){
        Comment.find({}, function(err, results){
            if(err){
              console.log(err);
            }else{
                res.json(results);
            }
        })
    },
  }

})();