var mongoose = require('mongoose');

var AnswerSchema = new mongoose.Schema({
    message: {
        type: String, 
        required: true,
        maxlength: 300,
    },
    upvotes: Number,
    downvotes: Number,  
    _user : { type : mongoose.Schema.Types.ObjectId, ref: 'User' },
    _topic : { type : mongoose.Schema.Types.ObjectId, ref: 'Topic' },
    _comments : [{ type : mongoose.Schema.Types.ObjectId, ref: 'Comment' }],  
    
}, {timestamps:true} );
mongoose.model('Answer', AnswerSchema);