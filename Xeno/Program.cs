using System;


class Am
{
    public virtual void call()
    {
        Console.WriteLine("Am");
    }
}

class Pm: Am
{
    public override void call()
    {
        Console.WriteLine("Pm");
    }

    
}
class Yo
{
    public static int Main()
    {
        Am am = new Am();
        Pm pm = new Pm();
        am.call();
        pm.call();
        return 0;
    }
}