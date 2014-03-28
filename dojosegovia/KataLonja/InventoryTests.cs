using System;
using System.Collections.Generic;
using NUnit.Framework;

namespace KataLonja
{
    public class InventoryTests
    {
        private City city;
        private Inventory inventory;

        [SetUp]
        public void Initialize()
        {
            inventory = new Inventory();

            city = new City("Madrid", 800);
            city.Prices.Add("Vieiras", 500);
            city.Prices.Add("Centollos", 450);
        }

        [Test]
        public void ItemsCanBeAdded()
        {
            inventory.Add("X", 100);
            Assert.That(inventory.Count, Is.EqualTo(1));
            inventory.Add("Y", 50);
            Assert.That(inventory.Count, Is.EqualTo(2));
            inventory.Add("Z", 50);
            Assert.That(inventory.Count, Is.EqualTo(3));
        }

        [TestCase(0, 0, 0, Result = 0)]
        [TestCase(50, 0, 0, Result = 23000)]
        [TestCase(0, 100, 0, Result = 0)]
        [TestCase(0, 0, 50, Result = 20700)]
        [TestCase(50, 100, 50, Result = 43700)]
        public double RevenueIsCalculatedCorrectly(double vieiras, double pulpo, double centollos)
        {
            inventory.Add("Vieiras", vieiras);
            inventory.Add("Pulpo", pulpo);
            inventory.Add("Centollos", centollos);

            return inventory.GetRevenueForCity(city);
        }

        [TestCase(0, 0, 0, Result = -1605)]
        [TestCase(50, 0, 0, Result = 21395)]
        [TestCase(0, 100, 0, Result = -1605)]
        [TestCase(0, 0, 50, Result = 19095)]
        [TestCase(50, 100, 50, Result = 42095)]
        public double ProfitIsCalculatedCorrectly(double vieiras, double pulpo, double centollos)
        {
            inventory.Add("Vieiras", vieiras);
            inventory.Add("Pulpo", pulpo);
            inventory.Add("Centollos", centollos);

            return inventory.GetProfitForCity(city);
        }
    }
}
