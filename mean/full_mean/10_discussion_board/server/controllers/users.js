const mongoose = require('mongoose')
const User = mongoose.model('User')
const Topic = mongoose.model('Topic')
const Comment = mongoose.model('Comment')

module.exports = (function() {
    return {

    create: function(req, res){
        var user = new User(req.body)
        user.save(function(err, results){

            if(err){
                res.json({error:err});
            }else{

                res.json(results);
            }
        });
    },
    check: function(req, res){
        User.find(req.params, function(err, results){
                if(err){
                  console.log(err);
                } else if (results != []) {
                    if(req.session.lastVisit) {console.log(req.session.lastVisit);}
                    if (results[0]) {
                        var time = new Date();
                        req.session.lastVisit = time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" .. "
                        +time.getHours()+"-"+time.getMinutes()+"-"+time.getSeconds();
                        req.session.user_info = {id:results[0]._id, name:results[0].name
                    }
                } 
            }
            res.json(results);
        })
    },
    show: function(req, res){
        User.find({}, function(err, results){
            if(err){
              console.log(err);
            }else{
                res.json(results);
            }
        })
    },
    findOne: function(req, res){
         User.find({_id:req.params.id})
        .populate('_topics')
        .exec(function(err, results){
            if(err){
              console.log(err);
            }else{
                res.json(results);
            }
        })
    },
    session: function(req, res){
        let userInfo = req.session['user_info']
     console.log('session', userInfo)
     if(req.session['user_info']){
       res.json({status:true, user: req.session['user_info'] })
     }else {
       res.json({status:false, errors:['user not found']})
     }
    },
    logout: function(req, res){
        req.session.destroy()
    },
  }


})();