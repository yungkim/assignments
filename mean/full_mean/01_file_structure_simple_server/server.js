var mongoose = require( 'mongoose' ),
    express  = require( 'express' ),
    bp       = require('body-parser'),
    path     = require( 'path' ),
    root     = __dirname,
    port     = process.env.PORT || 8000,
    app      = express();

// require the mongoose configuration file which does the rest for us
require('./server/config/mongoose.js');

app.use( express.static( path.join( root, 'client' )));
app.use( express.static( path.join( root, 'server' )));
app.use( express.static( path.join( root, 'bower_components' )));
app.use(bp.json())


app.listen( port, function() {
  console.log( `server running on port ${ port }` );
});