app.factory('usersFactory', function($http){
    var factory = {};

    factory.index = function(id, callback){
        $http.get('/user/' + id).then(function(returned_data){          
            console.log(returned_data.data[0].name)
        callback(returned_data)
      });
    };
    return factory;
});