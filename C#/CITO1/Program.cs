using System;

public class PP<T>
{
    private T[] one = new T[5];
    public T this [int index]
    {
        get
        {
            return one[index];
        }
        set
        {
            one[index] = value;
        }
    }

    public (T,string) this[int index, string index2]
    {
        get
        {
            return (one[index], "s");
        }
        set
        {
            (one[index],_) = value;
        }
    }

}

class Program
{
    public static int pp() => 2;
    static void Main()
    {
       
        Console.WriteLine(String.Format("Yo {0} {0}",1));
    }
}

