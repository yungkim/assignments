app.factory('answersFactory', function($http){
    var factory = {};

    factory.create = function(answer, callback){
      $http.post('/answers', answer).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };

    factory.upvote = function(answerId, callback){
      $http.put('/answers/' + answerId + '/up').then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };

   factory.downvote = function(answerId, callback){
      $http.put('/answers/' + answerId + '/down').then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };
    return factory;
});