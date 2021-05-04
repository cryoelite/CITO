using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;


namespace CITOTester
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestAdd()
        {
            int x = 4;
            int y = 5;
            int expected = 9;
            var _obj = new CITOClassLibrary.CITO();
            int answer = _obj.Add(x, y);
            Assert.AreEqual(expected, answer);

        }
    }
}
