using System;

namespace CITO_CoreCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}

public class Rootobject
{
    public string sheetName { get; set; }
    public Cell[] cells { get; set; }
}

public class Cell
{
    public string cellId { get; set; }
    public string data { get; set; }
    public Style style { get; set; }
}

public class Style
{
    public string someProp { get; set; }
}
