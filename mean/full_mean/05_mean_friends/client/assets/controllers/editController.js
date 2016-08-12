app.controller('editController', ['$scope','friendsFactory','$routeParams','$location', function($scope, friendsFactory, $routeParams, $location) {

    var self = this;
    self.friend = {};

    friendsFactory.show($routeParams, function(friendFromFactory){
        console.log('editController: friendFromFactory = ',friendFromFactory);
        $scope.friend = friendFromFactory;
        self.friend = friendFromFactory;
    });
    
    $scope.update = function(){
        console.log('>>> editController.update: ', self.friend);
        friendsFactory.update(self.friend);
        $location.path('/');
    };
}]);