using System;
using System.ComponentModel.DataAnnotations;

namespace CITO1
{
    public class Department
    {
        [Key]
        public int EmpID { get; set; }
        public string EmpName { get; set; }
        public double EmpPhone { get; set; }
        public DateTime DOJ { get; set; }
    }
}
