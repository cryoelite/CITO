using System;
using System.Threading.Tasks;
namespace CITO_CoreCsharp
{
    static class Program
    {
        static async Task<int> stuff(int k) {
            
            return k + 2;
        }



        static async Task Main(string[] args)
        {
            var pp = stuff(2);
            Console.WriteLine("1");
            await pp;
            Console.WriteLine($"pp is {pp.Result}");
            var ss = await stuff(3);
            Console.WriteLine($"ss is {ss}");
        }
    }
}
