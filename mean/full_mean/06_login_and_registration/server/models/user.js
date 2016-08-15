var mongoose = require('mongoose');

var UserSchema = new mongoose.Schema({
    
    email: {
        type: String,
        required: true,
        unique: true
    },
    first_name: {
        type: String, 
        required: true,
        // min: [2, 'Too few characters'],
        min: 2,
        max: 50
    },
    last_name: {
        type: String,
        // required: [true, 'Why no last name?']
        required: true,
        min: 2,
        max: 50
    },
    password: {
        type: String,
        required: true,
        min: 8,
        max: 20
    },
    birthday: {
        type: Date,
        required: true
    }
}, {timestamps:true} );

mongoose.model('User', UserSchema);