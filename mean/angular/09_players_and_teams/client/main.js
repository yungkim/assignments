
var app = angular.module('app', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'partials/players.html'
        })
        .when('/players', {
            templateUrl: 'partials/players.html'
        })
        .when('/teams', {
            templateUrl: 'partials/teams.html'
        })
        .when('/associations', {
            templateUrl: 'partials/associations.html'
        })
        .otherwise({
            redirectTo: '/'
        });
});

app.factory("playerFactory",[function(){
   var factory = {};
   var players = []; //Initialize our list of players

   //Pass the player list to a controller
   factory.index = function(callback){
      callback(players);
   }
   //Add new player to the list
   factory.create = function(player){
      players.push(player);
   }
   //Remove the player from the list
   factory.delete = function($index){
      players.splice($index, 1);
   }
    //Set a player's team name
   factory.addPlayerToTeam = function(data){
      players[data.playerIdx].team = data.team;
   }

   //Reset a player's team name to an empty string
   factory.removePlayerFromTeam = function($index){
      players[$index].team = "";
   }
   return factory;
}])

app.factory("teamFactory",[function(){
   var factory = {};
   var teams = []; //Initialize our list of teams

   //Pass the team list to a controller
   factory.index = function(callback){
      callback(teams);
   }
   //Add new team to the list
   factory.create = function(team){
      teams.push(team);
   }
   //Remove the team from the list
   factory.delete = function($index){
      teams.splice($index, 1);
   }
   return factory;
}])

//Inject playerFactory into each controller
app.controller("PlayersController", ['$scope', 'playerFactory', function($scope, playerFactory){
   function setPlayers(data){
      $scope.players = data;
      $scope.newPlayer = {};
   }

   $scope.players = [];

   //When this controller is loaded, fetch the player list
   playerFactory.index(setPlayers);

   //Pass new player info to the factory
   $scope.create = function(){
      playerFactory.create($scope.newPlayer)
      $scope.newPlayer = {}; //Reset our form
   }

   //Delegate deleting player to the factory
   $scope.delete = function($index){
      playerFactory.delete($index);
   }

}])

//Inject teamFactory into each controller
app.controller("TeamsController", ['$scope', 'teamFactory', function($scope, teamFactory){
   function setTeams(data){
      $scope.teams = data;
      $scope.newTeam = {};
   }

   $scope.teams = [];

   //When this controller is loaded, fetch the team list
   teamFactory.index(setTeams);

   //Pass new team info to the factory
   $scope.create = function(){
      teamFactory.create($scope.newTeam)
      $scope.newTeam = {}; //Reset our form
   }

   //Delegate deleting team to the factory
   $scope.delete = function($index){
      teamFactory.delete($index);
   }
}])

//Inject userFactory into each controller
app.controller("AssociationsController",['$scope', 'playerFactory', 'teamFactory', function($scope, playerFactory, teamFactory){
   function setPlayers(data){
      $scope.players = data;
      console.log(data)
   }
   function setTeams(data){
      $scope.teams = data;
   }

   $scope.players = [];
   $scope.teams = [];

   //When this controller is loaded, fetch the user list
   playerFactory.index(setPlayers);
   teamFactory.index(setTeams);

   //Pass the player index and team name to create association
   $scope.addPlayerToTeam = function(){
      playerFactory.addPlayerToTeam($scope.newAssoc);
   }

   //Pass $index to PlayerFactory to remove the player's team
   $scope.removePlayerFromTeam = function($index){
      playerFactory.removePlayerFromTeam($index);
   }
}])
