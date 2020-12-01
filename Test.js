
var mdt= require('./Module1.js');
var http=require('http');
console.log("ya time is %s here", mdt.mdt());
http.createServer(function(req,res){
    res.writeHead(200,{'Content-Type':'http/plain'});
    res.write("The time is %s here " +mdt.mdt());
    res.end('Hello Wosrlds!');
}).listen(8080);