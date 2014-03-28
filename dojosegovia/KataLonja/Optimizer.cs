using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class Optimizer
    {
        Inventory stock;

        public City BestCity { get; private set; }
        public double RevenueForBestCity { get; private set; }
        public double ProfitForBestCity { get; private set; }
        public Inventory ItemsSoldAtBestCity { get; private set; }

        public Optimizer(Inventory stock)
        {
            this.stock = stock;
        }

        public void LoadVanForCity(Van van, City city)
        {
            foreach (var pair in city.Prices.OrderByDescending((x) => x.Value))
            {
                string item = pair.Key;
                double amount = this.stock[item];

                if (amount > van.RemainingCapacity)
                    amount = van.RemainingCapacity;

                if (amount > 0)
                    van.Load(item, amount);
            }

            var profit = van.Contents.GetProfitForCity(city);
            if (profit > ProfitForBestCity)
            {
                BestCity = city;
                RevenueForBestCity = van.Contents.GetRevenueForCity(city);
                ProfitForBestCity = profit;
                ItemsSoldAtBestCity = van.Contents;
            }
        }

        public void SelectBestCity(ICollection<City> cities)
        {
            foreach (City city in cities)
            {
                Van van = new Van(200);
                LoadVanForCity(van, city);
            }
        }
    }
}
