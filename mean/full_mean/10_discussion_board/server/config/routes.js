const mongoose = require('mongoose')
const users = require('./../controllers/users.js');
const topics = require('./../controllers/topics.js');
const answers = require('./../controllers/answers.js');
const comments = require('./../controllers/comments.js');

module.exports = function(app){

  app.get('/users', users.show)
  app.post('/users', users.create)
  app.get('/users/:name', users.check)
  app.get('/user/:id', users.findOne)
  // app.delete('/customers/:id', customers.destroy)
  app.get('/session', users.session)
  app.post('/logout', users.logout)

  app.get('/topics', topics.show)
  app.post('/topics', topics.create)
  app.get('/topic/:id', topics.findOne)

  app.get('/answers', answers.show)
  app.post('/answers', answers.create)
  app.put('/answers/:id/up', answers.upvote)
  app.put('/answers/:id/down', answers.downvote)

  app.get('/comments', comments.show)
  app.post('/comments', comments.create)
}