 /* our angular app modularize, with config */
var app = angular.module('app', ['ngRoute']);

 /*
  Our factory: This is going to control all of our data.
  Modularize into a folder called: 'factories' within 'client'
*/
app.factory('userFactory', [function() {
  /* Our factory is going to provide the methods to gather user data from a RESTful API
        (we aren't quite there yet, but that's where we are going!)
      Index: return all users
      Show: return one user based on an a unique selector(often id)
      Create: generate a new user
      Update: update a specific user
      Delete: remove a specific user
      Our controller is going to determine what happens once we complete the change in the dataset using a callback function.
      These are denoted below, for clarity as: functionPassedByControllerAsAnArgTo **Method**
      Bonus: convert these callbacks to promises!
  */
  function UserConstructor() {

    var users = [
      {firstName: "Michael", lastName: "Jordan", birthday: '1980-08-04T07:00:00.000Z', createdAt: '2000-01-02T07:00:00.000Z'},
      {firstName: "Miller", lastName: "Park", birthday: "1989-08-04T07:00:00.000Z", createdAt: '2000-01-02T07:00:00.000Z'},
      {firstName: "Jeff", lastName: "Lee", birthday: "1993-08-04T07:00:00.000Z", createdAt: '2000-01-02T07:00:00.000Z'},
      {firstName: "Alice", lastName: "Johnson", birthday: "2000-08-04T07:00:00.000Z", createdAt: '2000-01-02T07:00:00.000Z'}];

    this.index = function(functionPassedByControllerAsAnArgToIndex) {
      if (typeof(functionPassedByControllerAsAnArgToIndex) === 'function') {
        functionPassedByControllerAsAnArgToIndex(users);
      }
    };
    /*
      Creates a newUser by pushing the newUser argument into the users array
      then runs the callback to return the updated array to controllers
    */
    this.create = function(newUser, functionPassedByControllerAsAnArgToCreate) {
      if (typeof(newUser) === 'object') {
        users.push(newUser)
      }
      if (typeof(functionPassedByControllerAsAnArgToCreate) === 'function') {
        functionPassedByControllerAsAnArgToCreate(users);
      }
    };
    /* perhaps a comment here about what this does would help us understand it! */
    this.update = function(updateUser, idx, functionPassedByControllerAsAnArgToUpdate) {
      if (users[idx]) {
        for (var key in updateUser) {
          users[idx][key] = updateUser[key];
        }
      }
      if (typeof(functionPassedByControllerAsAnArgToUpdate) === 'function') {
        functionPassedByControllerAsAnArgToUpdate(users[idx]);
      }
    }
    this.show = function(idx, functionPassedByControllerAsAnArgToShow) {
      if (typeof(functionPassedByControllerAsAnArgToShow) === 'function') {
        functionPassedByControllerAsAnArgToShow(users[idx]);
      }
    }
    this.delete = function(idx, functionPassedByControllerAsAnArgToDelete) {
      if (users[idx]) {
        users.splice(idx, 1);
      }
      if (typeof(functionPassedByControllerAsAnArgToDelete) === 'function') {
        functionPassedByControllerAsAnArgToDelete(users);
      }
    }
  }
  /*
    What is this factory returning?  Could we extend this code to be reused?
  */
  return (new UserConstructor());
}]);