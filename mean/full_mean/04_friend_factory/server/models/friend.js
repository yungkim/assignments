console.log('>>> models/friend.js');

var mongoose = require('mongoose');

// build your friend schema and add it to the mongoose.models
var FriendSchema = new mongoose.Schema({
    firstName: String,
    lastName: String,
    birthday: Date
});

mongoose.model('Friend', FriendSchema);