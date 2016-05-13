using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using KataLonja;

namespace KataLonjaTests
{
    [TestClass]
    public class DepreciacionTest
    {
        [TestMethod]
        public void Test_Depreciacion_CeroPorCiento()
        {
            Depreciación d = new Depreciación(0);
            Assert.AreEqual(50, d.Calcula(100, 50));
        }

        [TestMethod]
        public void Test_Depreciacion_CincuentaPorCiento()
        {
            Depreciación d = new Depreciación(50);
            Assert.AreEqual(25, d.Calcula(100, 50));
        }

        [TestMethod]
        public void Test_Depreciacion_CincuentaPorCiento_DoscientosKilometros()
        {
            Depreciación d = new Depreciación(50);
            Assert.AreEqual(0, d.Calcula(200, 50));
        }
    }
}
