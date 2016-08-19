app.controller('dashboardController', function(dashboardFactory, topicsFactory, $location, $scope){

    var index = function(){
        dashboardFactory.index(function(data){
            $scope.topics = data;
            // console.log('topics from http: ', $scope.topics);
            // console.log('what do we have', data)
        });
        dashboardFactory.session(function(data){
            $scope.session = data;
            if (!data.status) {
                $location.path('/')
            }
        });
    };
    index();

    $scope.logout = function(topic){
        dashboardFactory.logout()
    }

    $scope.createTopic = function(topic){
        topic._user = $scope.session.user.id
        console.log('I want to create this topic', topic)
        topicsFactory.create(topic, (data)=>{
            console.log('returned', data);$scope.error = data.error;}) ;
        index();    
    };
});