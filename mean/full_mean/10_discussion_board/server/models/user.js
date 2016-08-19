var mongoose = require('mongoose');

var UserSchema = new mongoose.Schema({
    name: {
        type: String, 
        required: true,
        maxlength: 40,
    },
    _topics : [{ type : mongoose.Schema.Types.ObjectId, ref: 'Topic' }],
    _comments : [{ type : mongoose.Schema.Types.ObjectId, ref: 'Comment' }],
_answers : [{ type : mongoose.Schema.Types.ObjectId, ref: 'Answer' }]
        
}, {timestamps:true} );
mongoose.model('User', UserSchema);