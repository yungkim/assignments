app.factory('customersFactory', ['$http', function($http) {
  var customer = [];
  function CustomersFactory(){
    var _this = this;
    this.create = function(customer, callback){
      $http.post('/customers/', customer).then(function(returned_data){
        console.log(returned_data.data)
        callback(returned_data.data)
      })
    };
    this.show = function(callback){
      $http.get('/customers/').then(function(returned_data){
        console.log(returned_data.data)
        callback(returned_data.data)
      })
    };
    this.destroy = function(customer){
      $http.delete('/customers/' + customer._id, customer)
    };
  }
  return new CustomersFactory();
}]);