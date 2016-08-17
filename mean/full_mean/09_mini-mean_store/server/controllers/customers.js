const mongoose = require('mongoose')
const Customer = mongoose.model('Customer')

module.exports = (function() {
  return {
    show: function(req, res){
                Customer.find({}, function(err, results){
                    if(err){
                        console.log(err);
                    }else{
                        res.json(results);
                    }
                })
            },

    create: function(req, res){
        var customer = new Customer(req.body)
                customer.save(function(err, results){
                    if(err){
                        res.json({error:err});
                    }else{
                        res.json(results);
                    }
                })
            },

    destroy: function(req, res){
                Customer.remove({_id:req.params.id}, function(err, results){
                    if(err){
                        console.log(err);
                    }else{
                        res.json(results);
                    }
                })
            },
  }
})()