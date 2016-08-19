const mongoose = require('mongoose')
const Topic = mongoose.model('Topic')
const User = mongoose.model('User')

module.exports = (function() {
  return {

    create: function(req, res){
        var topic = new Topic(req.body)
        topic.save(function(err, results){
            if(err){
                res.json({error:err});
            }else{
            User.update({ _id : req.session.user_info.id }, { $push : { _topics : results._id } }, function(err, updated) {
                res.send(results);
            });
                // res.json(results);
            }
        });
    },

    findOne: function(req, res){
         Topic.find({_id:req.params.id})
            .populate({
              path: '_answers', 
              model: 'Answer',
              populate: {
                path: '_user',
                model: 'User',
              },
            populate: {
                path: '_comments',
                model: 'Comment',
                populate: {
                path: '_user',
                model: 'User',
                },
              }                    
            })
            .populate({
              path: '_user', 
              model: 'User',
              populate: {
                path: '_topics',
                model: 'Topic'
              }        
            })
        .exec(function(err, results){
            if(err){
              console.log(err);
            }else{
                res.json(results);
            }
        })
    },

    show: function(req, res){
        Topic.find({})
            .populate({
              path: '_answers', 
              model: 'Answer',
              populate: {
                path: '_user',
                model: 'User',
              },
            populate: {
                path: '_comments',
                model: 'Comment',
                populate: {
                path: '_user',
                model: 'User',
                },
              }                    
            })
            .populate({
              path: '_user', 
              model: 'User',
              populate: {
                path: '_topics',
                model: 'Topic'
              }        
            })
        .exec(function(err, results){
            if(err){
              console.log(err);
            }else{
                res.json(results);
            }
        })
    },
  }

})();