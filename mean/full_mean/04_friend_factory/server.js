var mongoose = require( 'mongoose' ),
    express  = require( 'express' ),
    path     = require( 'path' ),
    bodyParser = require('body-parser'),
    root     = __dirname,
    port     = process.env.PORT || 8000,
    app      = express();


app.use(bodyParser.urlencoded({ extended:true }))
app.use(bodyParser.json()); 

app.use( express.static( path.join( root, 'client' )));
app.use( express.static( path.join( root, 'server' )));
app.use( express.static( path.join( root, 'bower_components' )));

// require the mongoose configuration file which does the rest for us
require('./server/config/mongoose.js');
require('./server/config/routes.js')(app);
// In using express, one of the common mistake is by requiring the express before mongoose. This results to "MissingSchemaError: Schema hasn't been registered for model "User"." error.
// You can easily fix it by correcting the "require" order (i.e mongoose then express)



app.listen( port, function() {
  console.log( `server running on port ${ port }` );
});