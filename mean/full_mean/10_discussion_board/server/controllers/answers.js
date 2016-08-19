const mongoose = require('mongoose')
const Answer = mongoose.model('Answer')
const User = mongoose.model('User')
const Topic = mongoose.model('Topic')

module.exports = {
  show : function(req, res) {
    Answer.find()
    .populate('_user')
    .exec(function(err, answers) {
      if (err) return res.send(err);

      res.send(answers);
    });
  },
  upvote : function(req, res) {
    console.log('up id', req)
    Answer.update({ _id : req.params.id }, { $inc : { upvotes : 1 } }, function(err, updated) {
      if (err) return res.send(err);

      res.send({success : true});
    });
  },
  downvote : function(req, res) {
    Answer.update({ _id : req.params.id }, { $inc : { downvotes : -1 } }, function(err, updated) {
      if (err) return res.send(err);

      res.send({success : true});
    });
  },
  create : function(req, res) {console.log('reqqqq',req.body)
    Answer.create({
      message : req.body.message,
      _topic : req.body._topic,
      _user : req.body._user
    }, function(err, answer) {
        console.log('where is answer')
      if (err) return res.send(err);
      console.log('what is answer', answer)
      User.update({ _id : answer._user }, { $push : { _answers : answer._id } },function(err, updatedUser) {
        Topic.update({ _id : answer._topic }, { $push : { _answers : answer._id } },function(err, updatedTopic) {
          res.send(answer);
        });
      });
    });
  }
};
