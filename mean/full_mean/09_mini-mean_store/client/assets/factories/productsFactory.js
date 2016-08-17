app.factory('productsFactory', function($http){
    var factory = {};
    var products = [];

    factory.index = function(callback){
        $http.get('/products').success(function(output){
            // products = output;
            callback(output);
        });
    };

    // factory.recent_show = function(callback){
    //     $http.get('/recent_products').success(function(output){
    //         callback(output);
    //     });
    // };

    factory.create = function(product, callback){
      $http.post('/products/', product).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };
    factory.update = function(product, callback){
      $http.put('/products/', product).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };
    return factory;
});