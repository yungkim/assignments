var mongoose = require('mongoose');
var OrderSchema = new mongoose.Schema({
    name: {
        type: String, 
        required: true
    },
    product: {
        type: String, 
        required: true
    },
    quantity: {
        type: Number, 
        required: true
    },
}, {timestamps:true} );
mongoose.model('Order', OrderSchema);