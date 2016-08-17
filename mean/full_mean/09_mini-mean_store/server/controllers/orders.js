const mongoose = require('mongoose')
const Order = mongoose.model('Order')

module.exports = (function() {
  return {

    show: function(req, res){
                Order.find({}, function(err, results){
                    if(err){
                        console.log(err);
                    }else{
                        res.json(results);
                    }
                })
            },

    create: (req, res) => {
        console.log(req.body)
        console.log('hello')
        var order = new Order(req.body)
                order.save(function(err, results){
                    if(err){
                        res.json({error:err});
                    }else{
                        res.json(results);
                    }
                })
    },// end:create

    login: (req, res) => {

    }, // end login
    logout: (req, res) => {

    }, // end logout
  }
})()