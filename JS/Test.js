const http = require("https");

const options = {
	"method": "GET",
	"hostname": "contextualwebsearch-websearch-v1.p.rapidapi.com",
	"port": null,
	"path": "/api/Search/ImageSearchAPI?q=taylor%20swift&pageNumber=1&pageSize=10&autoCorrect=true",
	"headers": {
		"x-rapidapi-key": "50876695a7mshf62b04ac4169fb9p16fd72jsn5cb2a7b054df",
		"x-rapidapi-host": "contextualwebsearch-websearch-v1.p.rapidapi.com",
		"useQueryString": true
	}
};

const req = http.request(options, function (res) {
	const chunks = [];

	res.on("data", function (chunk) {
		chunks.push(chunk);
	});

	res.on("end", function () {
		const body = Buffer.concat(chunks);
		console.log(body.toString());
	});
});

req.end();