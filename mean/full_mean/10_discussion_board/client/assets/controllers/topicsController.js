app.controller('topicsController', function(topicsFactory, dashboardFactory, answersFactory, commentsFactory, $location, $routeParams, $scope){

    var id = $routeParams.id;

    var index = function(){
        topicsFactory.index(id, function(data){
            $scope.topic = data;
            // console.log('topics from http: ', $scope.topics);
            // console.log('what do we have', data)
            console.log(data)
        });
        dashboardFactory.session(function(data){
            $scope.session = data;
            // console.log('topics from http: ', $scope.topics);
            // console.log('what do we have', data)
            if (!data.status) {
                $location.path('/')
            }
        });
    };
    index();

    $scope.createAnswer = function(newAnswer){
        if (newAnswer) {
            console.log(newAnswer);
            newAnswer._user = $scope.session.user.id;
            newAnswer._topic = id;
            console.log('I want to create this newAnswer', newAnswer);
            answersFactory.create(newAnswer, (data)=>{
                console.log('returned', data);$scope.error = data.error;}) ;
            index();
        }
    };

    $scope.upvote = function(answerId){
        console.log('thumbs up!', answerId)
        if (answerId) {
            // var topic._topic = answerId;
            answersFactory.upvote(answerId, (data)=>{
                console.log('returned', data);$scope.error = data.error;}) ;
            index();
        }
    };

    $scope.downvote = function(answerId){
        console.log('thumbs down!', answerId)
        if (answerId) {
            // var topic._topic = answerId;
            answersFactory.downvote(answerId, (data)=>{
                console.log('returned', data);$scope.error = data.error;}) ;
            index();
        }
    };

    $scope.createComment = function(newComment){
        if (newComment) {
            console.log(newComment);
            newComment._user = $scope.session.user.id;
            // newComment._answer = id;
            console.log('I want to create this newComment', newComment);
            commentsFactory.create(newComment, (data)=>{
                console.log('returned', data);$scope.error = data.error;}) ;
            index();
        }
    };

});