using System;

namespace CITO1
{
    class Program
    {
        static void Main(string[] args)
        {
            EFTest efContext = new EFTest();
            Department department = new Department { EmpName = "Rahul", EmpPhone = 123456 };
  
            efContext.Departments.Add(department);
            
            efContext.SaveChanges();
            Console.WriteLine("Hello World!");
        }
    }
}
