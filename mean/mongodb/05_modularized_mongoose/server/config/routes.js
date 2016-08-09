// here we load the Quote model that we created on the server.js page
var mongoose = require('mongoose');
var Dog = mongoose.model('Dog');
var dogs = require('../controllers/dogs.js');
module.exports = function(app) {
    app.get('/', function(req, res) {
        dogs.show(req, res)
    });
    app.get('/dogs/new', function(req, res) {
        res.render('new');
    });
    app.post('/dogs', function(req, res) {
        dogs.create(req, res)
    });
    app.get('/dogs/:id', function(req, res) {
        dogs.show_one(req, res)
    });
    app.get('/dogs/:id/edit', function(req, res) {
        dogs.edit(req, res)
    });
    app.post('/dogs/:id', function(req, res) {
        dogs.update(req, res)
    });
    app.post('/dogs/:id/destroy', function(req, res) {
        dogs.destroy(req, res)
    });
}