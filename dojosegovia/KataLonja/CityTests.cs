using System;
using System.Collections.Generic;
using NUnit.Framework;

namespace KataLonja
{
    public class CityTests
    {
        private City city;

        [SetUp]
        public void CreateCity()
        {
            city = new City("Madrid", 800);
            city.Prices.Add("Vieiras", 500);
            city.Prices.Add("Centollos", 450);
        }

        [Test]
        public void CityHasCorrectName()
        {
            Assert.That(city.Name, Is.EqualTo("Madrid"));
        }

        [Test]
        public void CityHasCorrectDistance()
        {
            Assert.That(city.Distance, Is.EqualTo(800));
        }

        [TestCase("Vieiras", 460)]
        [TestCase("Pulpo", 0)]
        [TestCase("Centollos", 414)]
        public void ActualPriceIsCorrect(string item, double expectedPrice)
        {
            var actualPrice = city.ActualPrice(item);
            Assert.That(actualPrice, Is.EqualTo(expectedPrice), "Not as expected");

            var calculatedPrice = city.Prices.ContainsKey(item)
                ? city.Prices[item] * (1.0 - city.Distance * 0.0001)
                : 0.0;
            Assert.That(actualPrice, Is.EqualTo(calculatedPrice), "Not as recalculated");
        }

        [Test]
        public void TravelCostIsCorrect()
        {
            Assert.That(city.TravelCost, Is.EqualTo(5 + 2 * 800));
        }
    }
}
