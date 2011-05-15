using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class PriceList : Dictionary<string, double> { }

    public class City
    {
        private double depreciationFactor;

        public City(string name, double distance)
        {
            this.Name = name;
            this.Distance = distance;
            this.Prices = new PriceList();
            this.depreciationFactor = 1.0 - distance * .0001;
        }

        public string Name { get; set; }
        public double Distance { get; set; }
        public PriceList Prices { get; set; }

        public double ActualPrice(string item)
        {
            if (!this.Prices.ContainsKey(item))
                return 0.0;

            return this.Prices[item] * depreciationFactor;
        }

        public double TravelCost
        {
            get { return 5 + 2 * Distance; }
        }
    }
}
