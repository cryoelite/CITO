using System;
using Microsoft.EntityFrameworkCore;
using System.Configuration;

namespace CITO1
{
    public class EFTest : DbContext
    {
        public DbSet<Department> Departments { get; set; }


        public EFTest() : base() { }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        =>  optionsBuilder.UseSqlServer(@"Server=.\CRYO_SQL_SERVER;User ID=sa;Password=Strumble5;Database=EmpDB;Integrated Security=True");

    }
}
