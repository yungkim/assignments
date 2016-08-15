var mongoose = require('mongoose');
var User = mongoose.model('User');

function UsersController(){
    this.index = function(req, res){
        User.find({}, function(err, data){
            if (err){
                res.json({err});
            }
            res.json({users:data});
        });
    };
  this.create = function(req,res) {
    console.log('>>> controllers/users.js, UsersController().create');
    var user = new User(req.body);

    if (!req.body.first_name || !req.body.last_name){
        console.log('*****Name empty!')
        res.json({message:'Please enter your full name'})
        return
    } else if (req.body.first_name.length < 2 || req.body.last_name.length < 2){
        console.log('*****Name too short!')
        res.json({message:'Name must be more than 2 characters'})
        return
    } else if (req.body.first_name.length > 50 || req.body.last_name.length > 50){
        console.log('*****Name too long!')
        res.json({message:'Name must be less than 50 characters'})
        return
    } else if (!req.body.email){
        console.log('*****Email empty!')
        res.json({message:'Email empty'})
        return
    } else if (!req.body.password || req.body.password.length < 8 || req.body.password.length > 20){
        console.log('*****Password too short/long!')
        res.json({message:'Password must be more than 2 characters and less than 20 characters'})
        return
    } else if (req.body.password !== req.body.password_confirm){
        console.log('*****Passwords do not match!')
        res.json({message:'Passwords do not match'})
        return
    } else if (!req.body.birthday){
        console.log('*****Birthday empty!')
        res.json({message:'Please enter your birthday'})
        return
    }
    user.save(function(error) {
        if (error){
            console.log('*****Email exists!')
            res.json({message:'Email already exists'})
            return
        }
        console.log('*****Saved!')
        console.log(error)
        res.json({message:'User created'})
        return
    });
  };
  this.login = function(req,res) {
    console.log('>>> controllers/users.js, UsersController().login');
    if (!req.body.email || !req.body.password){
        console.log('*****Email/password empty!');
        res.json({message:'Email/password empty'});
        return
    }
    User.find(req.body, function(err, data) {
            if (err){
                res.json({message:err});
            }
            res.json({message:data});
        });
    };
}
module.exports = new UsersController();