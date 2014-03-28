using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using NUnit.Framework;

namespace KataLonja
{
    public class OptimizerTests
    {
        private Optimizer optimizer;
        private IDictionary<string, City> cityIndex;

        [SetUp]
        public void Initialize()
        {
            Inventory stock = new Inventory();
            stock.Add("Vieiras", 50);
            stock.Add("Pulpo", 100);
            stock.Add("Centollos", 50);

            this.optimizer = new Optimizer(stock);
            this.cityIndex = new Dictionary<string, City>();

            var city = new City("Madrid", 800);
            city.Prices.Add("Vieiras", 500);
            city.Prices.Add("Centollos", 450);
            AddToIndex(city);

            var barcelona = new City("Barcelona", 1100);
            barcelona.Prices.Add("Vieiras", 450);
            barcelona.Prices.Add("Pulpo", 120);
            AddToIndex(barcelona);

            var lisbon = new City("Lisbon", 600);
            lisbon.Prices.Add("Vieiras", 600);
            lisbon.Prices.Add("Pulpo", 100);
            lisbon.Prices.Add("Centollos", 500);
            AddToIndex(lisbon);
        }

        [TestCase("Madrid", 43700, 42095)]
        [TestCase("Barcelona", 30705, 28500)]
        [TestCase("Lisbon", 61100, 59895)]
        public void OptimalLoadForOneCity(string cityName, double expectedRevenue, double expectedProfit)
        {
            var city = cityIndex[cityName];
            var van = new Van(200);

            this.optimizer.LoadVanForCity(van, city);
            this.optimizer.DumpResult();

            Assert.That(this.optimizer.BestCity.Name, Is.EqualTo(city.Name));
            Assert.That(this.optimizer.RevenueForBestCity, Is.EqualTo(expectedRevenue));
            Assert.That(this.optimizer.ProfitForBestCity, Is.EqualTo(expectedProfit));
        }

        [Test]
        public void OptimalLoadAcrossAllCities()
        {
            this.optimizer.SelectBestCity(cityIndex.Values);
            this.optimizer.DumpResult();

            Assert.That(optimizer.BestCity.Name, Is.EqualTo("Lisbon"));
            Assert.That(optimizer.RevenueForBestCity, Is.EqualTo(61100));
            Assert.That(optimizer.ProfitForBestCity, Is.EqualTo(59895));
        }

        private void AddToIndex(City city)
        {
            cityIndex[city.Name] = city;
        }
    }

    static class OptimizerExtensions
    {
        public static void DumpResult(this Optimizer optimizer)
        {
            // In deference to the guys who created the Kata
            CultureInfo esCulture = CultureInfo.CreateSpecificCulture("es-ES");

            Console.WriteLine("City:\t\t{0}", optimizer.BestCity.Name);
            Console.WriteLine("Revenue:\t{0}", optimizer.RevenueForBestCity.ToString("C", esCulture));
            Console.WriteLine("Profit:\t{0}", optimizer.ProfitForBestCity.ToString("C", esCulture));
            Console.WriteLine("Items Sold:");
            Console.WriteLine(optimizer.ItemsSoldAtBestCity);
        }
    }
}
