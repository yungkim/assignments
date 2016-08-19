app.factory('indexFactory', function($http){
    var factory = {};

    factory.check = function(user, callback){
        console.log('name recived at client factory', user)
      $http.get('/users/' + user.name, user).then(function(returned_data){
        console.log('data returned to client factory',returned_data)
        if (returned_data.data.length == 0){
            $http.post('/users/', user).then(function(returned_data){
                // console.log(returned_data.data)
                // callback(returned_data.data)
                $http.get('/users/' + user.name, user)
              });            
            }
        callback(returned_data)
      });
    };
    return factory;
});