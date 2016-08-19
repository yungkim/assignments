var mongoose = require('mongoose');

var TopicSchema = new mongoose.Schema({
    topic: {
        type: String, 
        required: true,
        maxlength: 80,
    },
        description: {
        type: String, 
        required: true,
        maxlength: 300,
    },
        category: {
        type: String, 
        required: true,
    },
    _answers: [{ type : mongoose.Schema.Types.ObjectId, ref: 'Answer' }],
    _user : { type : mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    
}, {timestamps:true} );
mongoose.model('Topic', TopicSchema);