const mongoose = require('mongoose')
const orders = require('./../controllers/orders.js');
const products = require('./../controllers/products.js');
const customers = require('./../controllers/customers.js');

module.exports = function(app){
  app.get('/products', products.show)
  app.post('/products', products.create)
  app.put('/products/', products.update)

  // app.post('/products', products.create)
  // app.post('/sessions', products.login)
  // app.delete('/sessions', products.logout)



  app.get('/customers', customers.show)
  app.post('/customers', customers.create)
  app.delete('/customers/:id', customers.destroy)


  app.get('/orders', orders.show)
  app.post('/orders', orders.create)
}