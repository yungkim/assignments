/*
      Our controllers: Modularize these into a folder called:
      'controllers' within 'client' (you can further organize all these if you desire: e.g. client/assets/js/controllers)
    */
    app.controller('indexController', ['$scope', 'userFactory', '$location', function($scope, userFactory, $location) {
      /* Private Methods */
      var usersIndex = function() {
          userFactory.index(function beingPassedToTheFactoryIndexByThisController(usersFromTheFactory) {
            $scope.users = usersFromTheFactory;
            console.log($scope.users) // list of users
          } /* end args passed to userFactor index */ ); //end userFactory method invokation
        } //end usersIndex

      /* Scope Methods */
      $scope.show = function(user_id) {
          $location.url('/edit/' + user_id);
        }
      $scope.new = function() {
          $location.url('/new');
        }
      $scope.delete = function(user_id) {
          userFactory.delete(user_id)
        }
        /* on load time */
      console.log("loading the controller");
      console.log(userFactory);
      console.log(this);
      usersIndex();
    }]);