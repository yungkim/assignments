app.controller('showController', ['$scope','friendsFactory', '$routeParams', function($scope, friendsFactory, $routeParams) {

    friendsFactory.show($routeParams, function(friendFromFactory){
        console.log('zzz',friendFromFactory);
        $scope.friend = friendFromFactory;
    });
    console.log('$scope.friend: ',$scope.friend)
}]);