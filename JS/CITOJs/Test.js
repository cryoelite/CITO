"use strict";

const robot = require("robotjs");
const coords = [
  { x: 2334, y: 318 },
  { x: 2600, y: 319 },
  { x: 2998, y: 316 },
  { x: 2334, y: 331 },
  { x: 2600, y: 336 },
  { x: 2998, y: 336 },
  { x: 2334, y: 352 },
  { x: 2600, y: 354 },
  { x: 2998, y: 356 },
];

const okcoord = { x: 2914, y: 593 };
function moveMouseAndClick(x, y) {
  robot.moveMouse(x, y);
  robot.mouseClick();
  robot.mouseClick();
}

function typeText(text) {
  for (let i = 0; i < 7; ++i) {
    robot.keyTap("delete");
  }
  //robot.typeStringDelayed(text, 5000);
  robot.typeString(text);
}

const pause = (_) => new Promise((resolve) => setTimeout(resolve, _));

async function controlMouseAndKeyboard() {
  robot.setKeyboardDelay(5);
  while (true) {
    let text = String();

    text = "BrandIT";
    moveMouseAndClick(coords[0].x, coords[0].y);
    typeText(text);

    text = "Know-How Transfer";
    moveMouseAndClick(coords[1].x, coords[1].y);
    typeText(text);

    text = "1";
    moveMouseAndClick(coords[2].x, coords[2].y);
    typeText(text);

    text = "FPSL Manual Balance Adjustment";
    moveMouseAndClick(coords[3].x, coords[3].y);
    typeText(text);

    text = "Know-How Transfer";
    moveMouseAndClick(coords[4].x, coords[4].y);
    typeText(text);

    text = "2";
    moveMouseAndClick(coords[5].x, coords[5].y);
    typeText(text);


    moveMouseAndClick(okcoord.x, okcoord.y);

    await pause(5000);
  }
}

setTimeout(controlMouseAndKeyboard, 10000);
