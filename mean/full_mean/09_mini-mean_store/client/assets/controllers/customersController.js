app.controller('customersController', ['$scope', '$location', 'customersFactory', function($scope, $location, customersFactory) {
    
    var index = function(){
        customersFactory.show(function(customersFromFactory){
            console.log('customersFromFactory');
            $scope.customers = customersFromFactory;
        });
    }
    index();

    $scope.create = function(customer){
        customersFactory.create(customer, (data)=>{
            console.log('returned', data);$scope.error = data.error;}) ;
        index();
    };
    $scope.delete = function(customer){
        customersFactory.destroy(customer) ;
        index();
    };

}]);