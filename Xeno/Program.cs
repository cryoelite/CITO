using System;
using System.Linq;
using System.Collections.Generic;
class main
{

    public static void maxDef( int a, int b, int c, int d)
    {
        int s = a;
        int t = b;
        while (a < c)
        {
            if (a + b > c)
                break;
            a = a + b;
            
        }
        while (b<d)
        {
            if (a + b > d)
                break;
            b = a + b;
        }
        
        Console.WriteLine($"{a} {b}");
        if (a == c && b == d)
            Console.WriteLine("Y");
        a = s;
        b = t;
        while (b < d)
        {
            if (a + b > d)
                break;
            b = a + b;
        }


        while (a < c)
        {
            if (a + b > c)
                break;
            a = a + b;

        }
        
        if (a == c && b == d)
            Console.WriteLine("Y");
        Console.WriteLine("n");



    }
    public static void Main()
    {

        maxDef(1, 4, 62, 45);

        
        


    }
}
