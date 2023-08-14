"use strict";

const ExcelJS = require("exceljs");

async function start() {
  const workbook = new ExcelJS.Workbook();
  await workbook.xlsx.readFile(
    "C:\\NFBase\\GitHub\\CodeITestOn\\JS\\CITOJs\\RI.xlsm"
  );

  await workbook.csv.writeFile(
    "C:\\NFBase\\GitHub\\CodeITestOn\\JS\\CITOJs\\RI.csv"
  );
}

async function end() {
  const workbook = new ExcelJS.Workbook();
  await workbook.csv.readFile(
    "C:\\NFBase\\GitHub\\CodeITestOn\\JS\\CITOJs\\RI.csv"
  );

  await workbook.xlsx.writeFile(
    "C:\\NFBase\\GitHub\\CodeITestOn\\JS\\CITOJs\\RI2.xlsx"
  );
}

start();
end();
