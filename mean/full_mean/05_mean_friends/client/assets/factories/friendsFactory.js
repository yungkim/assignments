console.log('>>> assets/factories/friendsFactory.js');
app.factory('friendsFactory', ['$http', function($http) {
  // constructor for our factory
  var friends = [];
  var friend = [];
  function FriendsFactory(){
    var _this = this;
    this.create = function(friend, callback){
      console.log('>>> friendFactory.create: ', friend)
      $http.post('/friends/', friend).then(function(returned_data){
      })
    };
    this.update = function(friend, callback){ // what parameters do we need?
      console.log('>>> friendFactory.update')
      $http.put('/friends/' + friend._id, friend).then(function(returned_data){
        console.log('update data from factory',returned_data.data);
      })
    };
    this.index = function(callback){
        console.log('>>> friendFactory.index')
      //call this method if you want to update or set the friends variable
      $http.get('/friends').then(function(returned_data){
        console.log(returned_data.data);
        friends = returned_data.data;
        callback(friends);
      });
 //Note: this can be shortened to $http.get('/friends').then(callback); 
 //But only if you only want to run the callback from the controller.
    };
    this.delete = function(friend, callback){// what parameters do we need?
      console.log('>>> friendFactory.delete: ', friend)
      $http.delete('/friends/' + friend._id, friend).then(function(returned_data){
      })
    };
    this.show = function(friend, callback){// what parameters do we need?
      console.log('>>> friendFactory.show: ', friend)
      $http.get('/friends/' + friend.id, friend).then(function(returned_data){
        friend = returned_data.data.data[0];
        console.log('***one friend!: ', friend)
        callback(friend);
      })
    };
    // Sometimes you might not want to make a DB call, and just get the information stored in the factory.
    this.getFriends = function(callback){
      callback(friends);
    };
    this.getFriend = function(callback){
        callback(friend);
    };
  }
  // console.log(new FriendsFactory());
  return new FriendsFactory();
}]);