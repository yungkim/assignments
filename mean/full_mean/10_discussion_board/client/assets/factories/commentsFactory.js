app.factory('commentsFactory', function($http){
    var factory = {};

    factory.create = function(comment, callback){
      $http.post('/comments', comment).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };
    return factory;
});