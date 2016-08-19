app.controller('indexController', function(indexFactory, dashboardFactory, $location, $scope){

    $scope.message = "";
    function titlize(v) {
      return v.charAt(0).toUpperCase() + v.substr(1).toLowerCase();
    }

    var index = function(){
        dashboardFactory.session(function(data){
            $scope.session = data;
            if (data.status) {
                $location.path('/dashboard')
            }
        });
    };
    index();

    $scope.check = function(user){
        if (user){
            user.name = titlize(user.name)
            indexFactory.check(user, (data)=>{
                console.log('Returned from client factory', data);$scope.error = data.error;}) ;
            $location.path('/dashboard');
        } else {
            $scope.message = "Enter minimum of 2 characters";
        };
    }
});