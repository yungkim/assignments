app.factory('ordersFactory', function($http){
    var factory = {};
    var orders = [];

    factory.index = function(callback){
        $http.get('/orders').success(function(output){
            // orders = output;
            callback(output);
        });
    };

    // factory.recent_show = function(callback){
    //     $http.get('/recent_orders').success(function(output){
    //         callback(output);
    //     });
    // };

    factory.create = function(order, callback){
      $http.post('/orders/', order).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      })
    }
    return factory;
});