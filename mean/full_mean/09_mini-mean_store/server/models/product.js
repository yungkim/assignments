var mongoose = require('mongoose');
var ProductSchema = new mongoose.Schema({
    name: {
        type: String,
        // required: true,
        // unique: true
    },
    image: {
        type: String
    },
    description: {
        type: String
    },
    quantity: {
        type: Number
    }
}, {timestamps:true} );
mongoose.model('Product', ProductSchema);