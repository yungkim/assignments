app.controller('newController', ['$scope','userFactory', '$location', function($scope, userFactory, $location) {
  $scope.addUser = function(){
    console.log($scope.user);
    userFactory.create($scope.user);
    $location.url('/index')
  }
}]);