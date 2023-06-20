"use strict";
const keysender = require("node-key-sender");

// Function to simulate the key press
function pressF15Key() {
  keysender.sendKey("f15");
  console.log("yo");
}

// Start an infinite loop with a 30-second delay
setInterval(pressF15Key, 30000);