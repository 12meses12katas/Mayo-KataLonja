using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class Inventory : Dictionary<string,double>
    {
        public double GetRevenueForCity(City city)
        {
            double result = 0.0;

            foreach (string product in Keys)
                result += city.ActualPrice(product) * this[product];

            return result;
        }

        public double GetProfitForCity(City city)
        {
            return GetRevenueForCity(city) - city.TravelCost;
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();

            foreach (string item in Keys)
                sb.AppendFormat("  {0}:\t{1}\n", item, this[item]);

            return sb.ToString();
        }
    }
}
