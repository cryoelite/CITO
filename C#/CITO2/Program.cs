using System;
using System.IO;
using System.Net;
using System.Collections.Generic;
using System.Linq;

internal class SavingsAccount
{
   public int num;
    public string pp;
    public int ll;
    public SavingsAccount(int one, string two, int three) => (num,pp,ll) = (one,two,three);

}
class Program
{

    public static void Main()
    {

        /*WebClient client = new WebClient();

        // Add a user agent header in case the
        // requested URI contains a query.

        client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

        Stream data = client.OpenRead("https://na.finalfantasyxiv.com/lodestone/worldstatus/");
        StreamReader reader = new StreamReader(data);
        string s = reader.ReadToEnd();
        Console.WriteLine(s);
        data.Close();
        reader.Close();*/
        GetAccountDetails("details.txt");
    }


    public static void GetAccountDetails(String filename)
    {
        string[] lines = System.IO.File.ReadAllLines(filename);
        List<SavingsAccount> savingsList = new List<SavingsAccount>();
        foreach (var line in lines)
        {
            string[] text = line.Split(",");
            savingsList.Add(new SavingsAccount(Convert.ToInt32(text[0].Trim()), text[1].Trim(), Convert.ToInt32(text[2].Trim())));
        }
        Console.WriteLine("All Account Details Added To List Successfully");
        Console.WriteLine(savingsList[2].pp);
        filecontent= System.IO.File.ReadAllText(filename);
    }
}