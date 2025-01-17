let http = require('http');

Port = 80;

http.createServer(function (req, res) {
    if (req.url == '/') {
        res.writeHead(200, {'Content-Type': 'text/html'});
        res.write('Application server response');
        res.end();
    }
}).listen(Port);

