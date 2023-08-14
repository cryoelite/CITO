using System.Text;
using System.Text.Json;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace ExcelDiff
{

    public class Program
    {
        public static void Main(string[] args)
        {
            if (!OperatingSystem.IsWindows()) throw new Exception("Only windows supported by ExcelDiff tool!");
            var filePath = @"C:\NFBase\GitHub\CodeITestOn\Cpp-sharp\XL\RI.xlsm";
            var folderPath = @"C:\NFBase\GitHub\CodeITestOn\Cpp-sharp\XL\Export\";
            new Program().ExportXL(filePath, folderPath);
        }


        /// <summary>
        /// Break down an xls* into text files.
        /// </summary>
        /// <param name="filePath">Provide the path to the xls* file</param>
        /// <param name="exportFolder">Provide the path to the folder where the export will be generated</param>
        public void ExportXL(string filePath, string exportFolder)
        {
            Console.WriteLine("Starting ExcelDiff to break down xls*");
            var importFilePathInfo = new FileInfo(filePath);
            var exportPathInfo = new DirectoryInfo(exportFolder);
            if (importFilePathInfo.Exists)
            {
                if (!exportPathInfo.Exists)
                {
                    Console.WriteLine("Export Folder doesn't exist, creating it.");
                    exportPathInfo.Create();
                }
                exportWorkbook(ref importFilePathInfo, ref exportPathInfo);
            }
        }

        /// <summary>
        /// Create an xlsm from text files.
        /// </summary>
        /// <param name="folderPath">Provide the path to the folder containing the text files. (These files must have been generated with this same tool)</param>
        public void ImportXL(string folderPath)
        {
            Console.WriteLine("Starting ExcelDiff to reconstitute an xls*");
        }



        private void exportWorkbook(ref FileInfo importFilePathInfo, ref DirectoryInfo exportPathInfo)
        {
            Console.WriteLine($"Exporting workbook {importFilePathInfo.Name}");
            int totalSheets;
            getWorkbookMetadata(ref importFilePathInfo, out totalSheets);

            for (int i = 0; i < totalSheets; ++i)
            {
                exportWorksheet(ref importFilePathInfo, ref exportPathInfo, i);
            }
        }

        private void getWorkbookMetadata(ref FileInfo importFilePathInfo, out int totalSheets)
        {
            using (FileStream fs = new FileStream(importFilePathInfo.FullName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                var workbook = new XSSFWorkbook(fs)!;
                totalSheets = workbook.NumberOfSheets;
            }
        }

        private void exportWorksheet(ref FileInfo importFilePathInfo, ref DirectoryInfo exportPathInfo, int index)
        {

            using (FileStream fs = new FileStream(importFilePathInfo.FullName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                var workbook = new XSSFWorkbook(fs)!;
                var worksheet = workbook.GetSheetAt(index);
                var rowCount = worksheet.LastRowNum + 1;
                var jsonSheet = new JsonSheet() { sheetName = worksheet.SheetName, cells = new List<JsonCell>()};

                var jsonFile = new FileInfo(Path.Combine(exportPathInfo.FullName, index.ToString() + ".json"));

                Console.WriteLine($"Exporting index {index} worksheet {worksheet.SheetName}");
                using (FileStream jsonFs = new FileStream(jsonFile.FullName, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.Read))
                {
                    for (int i = 0, colCount = 0; i < rowCount; ++i, colCount = 0)
                    {
                        IRow? row = worksheet.GetRow(i);
                        if (row == null) continue;

                        colCount = row.LastCellNum;
                        for (int j = 0; j < colCount; ++j)
                        {
                            var cell = row.GetCell(j);
                            if (cell == null) continue;
                            var jsonCell = new JsonCell() { cellId = $"{i}{j}", cellData = cell };
                            jsonSheet.cells.Add(jsonCell);
                        }
                    }
                    var jsonByteArray = getJsonByteArray(jsonSheet);
                    jsonFs.Write(jsonByteArray);
                    Console.WriteLine($"Finished writing to {jsonFile.Name}");
                }

            }
        }

        private byte[] getJsonByteArray(JsonSheet jsonSheet)
        {
            Console.WriteLine($"Getting json string for {jsonSheet?.sheetName} with {jsonSheet?.cells?.Count} cells");
            var options = new JsonSerializerOptions
            {
                IncludeFields = true,
            };
            string jsonString = JsonSerializer.Serialize(jsonSheet, options);
            var utf8 = new UTF8Encoding();
            byte[] ba = utf8.GetBytes(jsonString);
            return ba;
        }

    }

    public class JsonSheet
    {
        public string? sheetName { get; set; }
        public List<JsonCell>? cells {get; set;}

    }

    public class JsonCell
    {
        public string? cellId { get; set; }
        public NPOI.SS.UserModel.ICell? cellData { get; set; }

    }

}