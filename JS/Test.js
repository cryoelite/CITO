const http = require("https");
const jsdom = require("jsdom");
const { JSDOM } = jsdom;

const options = {
	"method": "GET",
	"hostname": "api.flutter.dev",
	"port": null,
	"path": "/flutter/widgets/AbsorbPointer-class.html",
	
};

const req = http.request(options, function (res) {
	const chunks = [];

	res.on("data", function (chunk) {
		chunks.push(chunk);
	});

	res.on("end", function () {
		const body = Buffer.concat(chunks);
		let page= new JSDOM(body);
		let items=page.window.document.getElementsByTagName('ol')[2].children;
		let itemsList=[];
		for(let elem of items)
			itemsList.push(elem.textContent);
		itemsList.sort();
		for(let elem of itemsList)
			console.log(elem)
		
	});
});

req.end();