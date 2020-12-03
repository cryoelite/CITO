
var mdt = require('./Module1.js');
var http = require('http');
var url = require('url');
var page = require('fs');
http.createServer(function (req, res) {
    page.readFile('Web.html', function (err, data) {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        var q = url.parse(req.url, true).query;
        res.write(q.year + " " + q.month);
        res.end(data);
    });

}).listen(8080);