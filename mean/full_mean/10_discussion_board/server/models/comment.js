var mongoose = require('mongoose');

var CommentSchema = new mongoose.Schema({
    text: {
        type: String, 
        required: true,
        maxlength: 300,
    },
    _answer : { type : mongoose.Schema.Types.ObjectId, ref: 'Answer', required: true },
    _user : { type : mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
       
}, {timestamps:true} );
mongoose.model('Comment', CommentSchema);