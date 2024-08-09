"use strict";

const fs = require("node:fs");
const cheerio = require("cheerio");

function main() {
  let filePath = "./StartHackerRank.html";
  fs.readFile(filePath, "utf-8", (err, data) => {
    if (err) {
      console.log(`Error: ${err}`);
      return;
    }
    const $ = cheerio.load(data);
    const $c6 = $(".c6");

    const hackerrankElems = $c6.filter(function (i, el) {
      return el.attribs["href"].includes("hackerrank");
    });

    hackerrankElems.each(function (i, elem) {
      let url = elem.attribs["href"];
      let name = url.split("/")[7].split('?')[0];
      setupFolder(url, name, i + 1);
    });
  });
}

function setupFolder(url, name, index) {
  let templateFile = "C:\\NFBase\\Github\\Hack_300\\Template.cpp";
  let problemDir =
    "C:\\NFBase\\Github\\Hack_300\\ProblemsN\\" +
    index +
    "_" +
    "HR_" +
    name +
    "\\";
  let problemFile = problemDir + "program.cpp";
  let inputFile = problemDir + "input.txt";
  let outputFile = problemDir + "output.txt";
  let carSh = problemDir + "car.sh";
  let commentedURL = "// " + url + " \n";
  let carShContent = `#!/bin/bash
  echo "Getting env variable"
  env_var=$(<../../.env)
  export "\${env_var?}"=true
  clang++ problem.cpp -o problem -std=c++20 && ./problem
  `;
  let errcallback = function callback(err) {
    console.log(
      `Failed to modify setup problem ${problemDir} with err: ` + err
    );
  };
  try {
    fs.mkdirSync(problemDir, { recursive: true }, (err, _) => {
      errcallback(err);
    });
    let data = fs.readFileSync(templateFile);
    let fd = fs.openSync(problemFile, "w+");
    let buffer = Buffer.from(commentedURL);

    fs.writeSync(fd, buffer, 0, buffer.length, 0);
    fs.writeSync(fd, data, 10, data.length - 10, buffer.length);

    fs.closeSync(fd);

    fs.writeFileSync(inputFile, "", { flag: "w+" });
    fs.writeFileSync(outputFile, "", { flag: "w+" });
    fs.writeFileSync(carSh, carShContent, { flag: "w+" });

    console.log(problemFile + " written succesfully");
  } catch (err) {
    console.log(`File ${index} with ${name} died with ${err}`);
  }
}

main();
