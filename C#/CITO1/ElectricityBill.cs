using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BillAutomation    //DO NOT change the namespace name
{

    public class ElectricityBill         //DO NOT change the class name
    {
        private String consumerName;
        private String consumerNumber;
        private int unitsConsumed;
        private double billAmount;

        public String ConsumerName
        {
            get => consumerName;
            set => consumerName = value;
        }
        public String ConsumerNumber
        {
            get => consumerNumber;
            set => consumerNumber = value;
        }
        public int UnitsConsumed
        {
            get => unitsConsumed;
            set => unitsConsumed = value;
        }
        public double BillAmount
        {
            get => billAmount;
            set => billAmount = value;
        }
        public ElectricityBill(String name, String number, int units) => (consumerName, consumerNumber, unitsConsumed) = (name, number, units);
        public ElectricityBill() { }
    }
}
