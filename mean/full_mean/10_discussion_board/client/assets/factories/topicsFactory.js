app.factory('topicsFactory', function($http){
    var factory = {};

    factory.create = function(topic, callback){
      $http.post('/topics/', topic).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };

    factory.index = function(id, callback){
        $http.get('/topic/' + id).then(function(returned_data){         
            console.log(returned_data.data[0])
        callback(returned_data)
      });
    };
    return factory;
});