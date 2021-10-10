using System.Collections.Generic;
using System;

namespace CITO_Console
{
	
	public class Program
	{
		public static void Main()
		{
			var list = new List<int>() { 1, 2, 3, 4, 5 };
			var list2 = list.ToArray()[^2..];
			foreach (var elem in list2)
			{
				Console.WriteLine(elem);
			}
		}
	}
}
