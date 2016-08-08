var mongoose = require('mongoose'); // Require the Mongoose
var express = require('express'); // Require the Express Module
var app = express(); // Create an Express App
var bodyParser = require('body-parser'); // Require body-parser (to receive post data from clients)
app.use(bodyParser.urlencoded({ extended: true })); // Integrate body-parser with our App
var path = require('path'); // Require path

app.use(express.static(path.join(__dirname, './static'))); // Setting our Static Folder Directory
app.set('views', path.join(__dirname, './views')); // Setting our Views Folder Directory
app.set('view engine', 'ejs'); // Setting our View Engine set to EJS

// This is how we connect to the mongodb database using mongoose -- "mongoose_dashboard" is the name of
//   our db in mongodb -- this should match the name of the db you are going to use for your project.
mongoose.connect('mongodb://localhost/message_board');

var Schema = mongoose.Schema;
var postSchema = new mongoose.Schema({
    name: { type: String, required: true }, 
    text: { type: String, required: true }, 
    _comments: [{type: Schema.Types.ObjectId, ref: 'Comment'}]
}, { timestamps: true });
//  notice the _comments property is an array populated with objects.  The 'type' property of the object//  inside of the array is an attribute that tells Mongoose what to look for.
mongoose.model('Post', postSchema);
var Post = mongoose.model('Post');

var commentSchema = new mongoose.Schema({
    // since this is a reference to a different document, the _ is the naming convention!
    _post: {type: Schema.Types.ObjectId, ref: 'Post'},
    name: { type: String, required: true },
    text: { type: String, required: true },
}, {timestamps: true });
mongoose.model('Comment', commentSchema);
var Comment = mongoose.model('Comment');

// Routes
app.get('/', function(req, res) {
    Post.find({}, false, true).populate('_comments').exec(function(err, messages) {
        console.log(messages);
        res.render('index', { results: messages});
    });
});

// Create post
app.post('/message', function(req, res){
  // Create a new post!
  Post.create(req.body, function(err, result){
    if (err) { console.log(err); }
    res.redirect('/')
  });
});

// Create comment
app.post('/comment/:id', function (req, res){
    Post.findOne({_id: req.params.id}, function(err, post){
        // data from form on the front end
        var comment = new Comment(req.body);
        //  set the reference like this:
        comment._post = post._id;
        Post.update({_id: post._id}, {$push: {"_comments": comment}}, function(err){
        });
        // now save both to the DB
        comment.save(function(err){  
            if(err) {
                console.log('Error');
            } else {
                res.redirect('/');
            }
        });
    });
 });

// Setting our Server to Listen on Port: 8000
app.listen(8000, function() {
    console.log("listening on port 8000");
});