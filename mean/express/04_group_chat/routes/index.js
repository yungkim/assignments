module.exports = function Route(app, server){
    var io = require('socket.io').listen(server)
    var users = [];
    var chat = [];
    io.sockets.on('connection', function (socket) {

        socket.on("check_user", function (data){
            if (users.includes(data.user_name) == false) {
                users.push(data.user_name)
                console.log(users)
            } else {
                io.emit('user_exists', {response: 'Error: Duplicated User Name (' + data.user_name + ') in Use.'});
            }
        });

        socket.on("send_button", function (data){
            chat.push(data);
            io.emit('push_chat', {response: chat});
        });


        socket.on('disconnect', function() {
            console.log('user disconnected'); 
            chat.push({user_name: 'Somebody', text: '<i>left chat room.</i>'});
            io.emit('push_chat', {response: chat});
         });
       


    });
    // root route to render the index.ejs view
    app.get('/', function(req, res) {
     res.render("index");
    });
};