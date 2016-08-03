// var fs = require('fs');

// module.exports = function(request, response) {
//     console.log('Request', request.url);
//     if (request.url === '/') {
//         response.writeHead(200, {'Content-type': 'text/html'});
//         fs.readFile('./views/index.html', 'utf8', function(errors, contents) {
//         response.write(contents);
//         response.end();
//         })
//     } else if (request.url === '/dojo.html') {
//         response.writeHead(200, {'Content-type': 'text/html'});
//         fs.readFile('./views/dojo.html', 'utf8', function(errors, contents) {
//         response.write(contents);
//         response.end();
//         })
//     } else {
//         response.writeHead(404);
//         response.end('File not found!!!');
//     }
//     console.log('Response', response._header);
// }

var fs = require('fs');
var path = require('path');

module.exports = function (request, response){
    fs.exists('.'+request.url, function(exists) {
        console.log(path.dirname(request.url))
        console.log(path.basename(request.url))
        if(exists) {
            if(request.url === '/')   {
                fs.readFile('./views/index.html', 'utf8', function(errors, contents) {
                    response.write(contents);
                    response.end();
                })
            } else if ((path.dirname(request.url) == '/private') || (path.dirname(request.url) === '/' && path.basename(request.url).toLowerCase() === 'private')) {
                response.end('Private!!!');
            } else {
                fs.readFile('.'+path.dirname(request.url)+'/'+path.basename(request.url), function(errors, contents) {
                    response.write(contents);
                    response.end();
                })
            }
        } else {
            response.end('File not Found!!!');
        }
    })
};