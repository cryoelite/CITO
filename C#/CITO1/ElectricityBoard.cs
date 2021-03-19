using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace BillAutomation      //DO NOT change the namespace name
{

    public class ElectricityBoard  //DO NOT change the class name
    {
        public SqlConnection SqlCon { get; set; }
        public void AddBill(ElectricityBill ebill)
        {
            try
            {
                string query = "insert into ElectricityBill values('" + ebill.ConsumerNumber + "', '" + ebill.ConsumerName + "', " + ebill.UnitsConsumed + ", " + ebill.BillAmount + ")";
                SqlCon.Open();
                SqlCommand cmd = new SqlCommand(query, SqlCon);
                var execute = cmd.ExecuteScalar();
                SqlCon.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("Error:" + e.Message);
            }
        }        public void CalculateBill(ElectricityBill ebill)
        {
            int units = ebill.UnitsConsumed;
            double amt = 0;
            for (int i = 1; i <= units; ++i)
            {
                if (i <= 100)
                    amt += 0;
                else if (i > 100 && i <= 300)
                    amt += 1.5;
                else if (i > 300 && i <= 600)
                    amt += 3.5;
                else if (i > 600 && i <= 1000)
                    amt += 5.5;
                else
                    amt += 7.5;
            }
            ebill.BillAmount = amt;
  


        }        public List<ElectricityBill> Generate_N_BillDetails(int num)
        {
            try
            {
                string query = "Select TOP " + num + " * from ElectricityBill ORDER BY consumer_number desc";
                SqlCon.Open();
                SqlCommand cmd = new SqlCommand(query, SqlCon);
                SqlDataReader reader = cmd.ExecuteReader();
                List<ElectricityBill> l = new List<ElectricityBill>();
                while (reader.Read())
                {
                    ElectricityBill eBill = new ElectricityBill(reader[1].ToString(),reader[0].ToString(),(int)reader[2]);
                    eBill.BillAmount = (double)reader[3];
                    l.Add(eBill);
                }
                SqlCon.Close();
                return l;
            }
            catch (Exception e)
            {
                Console.WriteLine("Error1: " + e.Message);
            }
            return null;

        }

    }
}

