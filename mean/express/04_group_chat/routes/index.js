module.exports = function Route(app, server){
    var io = require('socket.io').listen(server)
    var chat = [];
    io.sockets.on('connection', function (socket) {
        socket.on("send_button", function (data){
            chat.push(data)
            io.emit('push_chat', {response: chat});
        })
    })
    // root route to render the index.ejs view
    app.get('/', function(req, res) {
     res.render("index");
    })
};