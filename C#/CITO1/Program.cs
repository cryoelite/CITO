using System;
using System.Data.Entity;
using System.Collections.Generic;

public class SContext : DbContext
{
    public SContext() { }

    public DbSet<Student> Students { get; set; }
    public DbSet<StudentAddress> StudentAddresss { get; set; }

}

public class Student
{
    public string Name { get; set; }
    public int RollNo { get; set; }
}

public class StudentAddress
{
    public List<int> HouseNos { get; set; }
}


public class Heya

{



    public static void Main()
    {
        SContext context = new SContext();
        context.Students.Add(new Student() { Name = "Ak", RollNo = 12 });
        context.SaveChanges();


        Console.WriteLine("Lol");
    }
}