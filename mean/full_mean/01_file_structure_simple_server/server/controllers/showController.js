/* EDIT CONTROLLER: this controller uses 'this', and the controlValue seems to not update (a bug for you to fix! possibly one new line of code ~ 14 characters, and one modification of something that already exists)*/
    app.controller('showController', ['$scope', 'userFactory', '$location', '$routeParams', function($scope, userFactory, $location, rParams) {


      /* Public Methods */
      this.getUser = function() {
        userFactory.show(rParams.id, function passedToUserFactoryShow(user) {
          $scope.user = user;
        })
      }


      /* on load time */
      this.getUser();
      console.log(this);
    }]);