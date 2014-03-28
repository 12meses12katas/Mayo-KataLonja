using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KataLonja
{
    public class Van
    {
        public double Capacity { get; private set; }
        public Inventory Contents { get; private set; }

        public Van(double capacity)
        {
            this.Capacity = capacity;
            this.Contents = new Inventory();
        }

        public double CurrentWeight
        {
            get { return Contents.Values.Sum(); }
        }

        public double RemainingCapacity
        {
            get { return Capacity - CurrentWeight; }
        }

        public void Load(string name, double amount)
        {
            if (CurrentWeight + amount > Capacity)
                throw new InvalidOperationException("The van is overloaded");

            Contents.Add(name, amount);
        }
    }
}
