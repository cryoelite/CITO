using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
// Compiler version 4.0, .NET Framework 4.5


namespace Dcoder
{
    public class Program
    {
        public static void Main(string[] args)
        {
            //Your code goes here
            bool shouldResume = true;
            while (shouldResume)
            {
                Console.WriteLine("Enter Company Name and Registration Date information seperated by comma (,):");
                string inp = Console.ReadLine();
                string[] inpList = inp.Split(',');
                string name = inpList[0];
                string date = inpList[1];

                string[] dateListString = date.Split('-');
                int[] dateList=new int[3];
                foreach (var x in dateListString)
                    dateList.Append(Convert.ToInt32(x));
                DateTime dateTime = Convert.ToDateTime(date);
                Console.WriteLine(dateTime);
            }
        }
    }
}