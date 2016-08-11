app.controller('newController', ['$scope','userFactory', '$location', function($scope, userFactory, $location) {
  $scope.addUser = function(){
    console.log($scope.user);
    $scope.user.createdAt = new Date();
    userFactory.create($scope.user);
    $location.url('/index')
  }
}]);