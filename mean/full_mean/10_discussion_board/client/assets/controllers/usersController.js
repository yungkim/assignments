app.controller('usersController', function(usersFactory, $location, $routeParams, $scope){

    var id = $routeParams.id;

    var index = function(){
        usersFactory.index(id, function(data){
            $scope.user = data;
            console.log(data)
        });
    };
    index();

});