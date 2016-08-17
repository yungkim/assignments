var mongoose = require('mongoose');
var CustomerSchema = new mongoose.Schema({
    name: {
        type: String, 
        required: true
    }
}, {timestamps:true} );
mongoose.model('Customer', CustomerSchema);