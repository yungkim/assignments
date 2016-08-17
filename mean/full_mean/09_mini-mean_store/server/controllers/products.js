const mongoose = require('mongoose')
const Product = mongoose.model('Product')

module.exports = (function() {
  return {

    show: function(req, res){
        Product.find({}, function(err, results){
            if(err){
                console.log(err);
            }else{
                res.json(results);
            }
        })
    },
    create: function(req, res){
        console.log(req.body)
        var product = new Product(req.body);
        product.save(function(err){
            if(err){
                console.log('fail to add to database!', err);
                res.json(err);
            }else{
                console.log('successfully added to the database');
                module.exports.show(req, res);
            }
        })
    },
    update: function(req, res){
        Product.findOne({_id: req.body._id}, function(err, product) {
              product.quantity = req.body.quantity
              product.save(function(err) {
                if(err) { console.log(err); }
                res.json(product);
              })
            })
    },
  }
})()