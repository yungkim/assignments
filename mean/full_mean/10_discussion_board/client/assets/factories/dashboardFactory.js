app.factory('dashboardFactory', function($http){
    var factory = {};

    factory.index = function(callback){
        $http.get('/topics').success(function(output){
            // products = output;
            callback(output);
        });
    };
    factory.session = function(callback){
        $http.get('/session').success(function(output){
            // products = output;
            callback(output);
        });
    };

    factory.create = function(topic, callback){
        // topic._user = req.session.user_info.id
      $http.post('/topics/', topic).then(function(returned_data){
        // console.log(returned_data.data)
        // callback(returned_data.data)
      });
    };
        factory.logout = function(){
      $http.post('/logout/')
      
    };



    return factory;
});