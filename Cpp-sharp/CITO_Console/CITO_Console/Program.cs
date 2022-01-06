using System.Collections.Generic;
using System;
using DiffMatchPatch;

namespace CITO_Console
{
	
	public class Program
	{
		public static void Main()
		{
			var dmp= new diff_match_patch();
			while (true)
			{
				Console.Clear();
				Console.WriteLine("Enter 2 texts seperated by enter");
				var input1 = Console.ReadLine().Trim().Replace(" ","");
				
				var input2 = Console.ReadLine().Trim().Replace(" ", "");
				var diff = dmp.diff_main(input1, input2);
				var result=dmp.diff_levenshtein(diff);

				Console.WriteLine("Result = " + result);
				double similarity = 100 - ((double)result / Math.Max(input1.Length, input2.Length) * 100);
				Console.WriteLine("Similarity = " + similarity);

				Console.WriteLine("Insert 'q' and then press enter to exit");
				var input3 = Console.ReadLine().Trim().Replace(" ", "");

				if (input3 == "q")
				{
					break;
				}

			}
		}
	}
}
