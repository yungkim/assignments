app.factory('usersFactory', ['$http', function($http) {
  // constructor for our factory
  var users = [];
  var user = [];
  function UsersFactory(){
    var _this = this;
    this.create = function(user, callback){
      console.log('>>> userFactory.create: ', user)
      $http.post('/users/', user).then(function(returned_data){
        console.log(returned_data.data)
        callback(returned_data.data)
      })
    };
    this.login = function(user, callback){
      console.log('>>> userFactory.login: ', user)
      $http.post('/users/login', user).then(function(returned_data){
        console.log(returned_data.data)
        callback(returned_data.data)
      })
    };
  }
  return new UsersFactory();
}]);