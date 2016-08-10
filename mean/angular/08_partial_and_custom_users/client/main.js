
var app = angular.module('app', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'partials/customizeUsers.html'
        })
        .when('/partial2', {
            templateUrl: 'partials/userList.html'
        })
        .otherwise({
            redirectTo: '/'
        });
});

app.factory("userFactory",[function(){
   var factory = {};

   //Initialize our list of users
   var users = [];
   //    {firstName: "Yukihiro", lastName: "Matsumoto", language: "Ruby"},
   //    {firstName: "Ryan", lastName: "Dahl", language: "Javascript"},
   //    {firstName: "Brendan", lastName: "Eich", language: "Javascript"}
   // ];


   //Pass the user list to a controller
   factory.index = function(callback){
      callback(users);
   }

   //Add new user to the list
   factory.create = function(user){
      users.push(user);
   }

   //Remove the user from the list
   factory.delete = function($index){
      users.splice($index, 1);
   }
   return factory;
}])

//Inject userFactory into each controller
app.controller("CustomizeUsersController", ['$scope', 'userFactory', function($scope, userFactory){
   function setUsers(data){
      $scope.users = data;
      $scope.newUser = {};
   }

   $scope.users = [];

   //When this controller is loaded, fetch the user list
   userFactory.index(setUsers);

   //Pass new user info to the factory
   $scope.create = function(){
      userFactory.create($scope.newUser)
      $scope.newUser = {}; //Reset our form
   }

   //Delegate deleting user to the factory
   $scope.delete = function($index){
      userFactory.delete($index);
   }
}])

//Inject userFactory into each controller
app.controller("UserListsController",['$scope', 'userFactory', function($scope, userFactory){
   function setUsers(data){
      $scope.users = data;
   }

   $scope.users = [];

   //When this controller is loaded, fetch the user list
   userFactory.index(setUsers);
}])