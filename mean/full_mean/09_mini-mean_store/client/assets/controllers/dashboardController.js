app.controller('newController', ['$scope', '$location', 'usersFactory', function($scope, $location, usersFactory) {
    $scope.create = function(user){
        console.log('>>> newController.create: ', user)
        usersFactory.create(user, (data)=>{console.log('returned', data);$scope.message = data.message;}) ;
    };
    $scope.login = function(user){
        console.log('>>> newController.login: ', user)
        usersFactory.login(user, (data)=>{
            console.log('returned', data);
            if (data.message.length ==1){
                $scope.message = 'Hello, ' + data.message[0].first_name;
                $scope.session = true;
            } else {$scope.message = 'Login Error'}
        }) ;
    };
    $scope.logout = function(){
        $scope.message = 'Logged out!';
        $scope.session = false;
    };
}]);