app.controller('newController', ['$scope', '$location', 'friendsFactory', function($scope, $location, friendsFactory) {
    /*
      THIS INDEX METHOD ACCESSES THE FRIENDS FACTORY AND RUNS THE FRIENDS INDEX.
      WE MIGHT RE USE INDEX A FEW TIMES, SO TO MINIMIZE REPETITION WE SET IT AS A VARIABLE.
    */
    var index = function(){
        friendsFactory.index(function(returnedData){
            $scope.friends = returnedData;
            console.log($scope.friends);
        });
    };
    index();
    /*
      OUR $scope.create function goes here <-- $scope because we need to access this method 
      with ng-submit or ng-click (from the form in the previous assignment).  
      Want to all of the friends when we get back?  We can re-run index.
    */
    $scope.create = function(friend){
        console.log('>>> newController.create: ', friend)
        friendsFactory.create(friend);
        // $scope.newUser = {};
        $location.path('/');
    };
    $scope.delete = function(friend){
        console.log('>>> newController.delete: ', friend);
        friendsFactory.delete(friend);
        index();
    };
    $scope.show = function(friend){
        console.log('>>> newController.show: ', friend);
        $location.path('/show/' + friend._id);
    };
    $scope.update = function(friend){
        console.log('>>> newController.update: ', friend);
        $location.path('/edit/' + friend._id);
    };
}]);