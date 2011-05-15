using System;
using System.Collections.Generic;
using NUnit.Framework;

namespace KataLonja
{
    public class VanTests
    {
        private Van van;

        [SetUp]
        public void CreateVan()
        {
            this.van = new Van(200);
        }

        [Test]
        public void HasSpecifiedCapacity()
        {
            Assert.That(van.Capacity, Is.EqualTo(200));
        }

        [Test]
        public void InitialWeightIsZero()
        {
            Assert.That(van.CurrentWeight, Is.EqualTo(0));
            Assert.That(van.RemainingCapacity, Is.EqualTo(200));
        }

        public void LoadingVanIncreasesWeightAndDecreasesRemainingCapacity()
        {
            van.Load("X", 100);
            Assert.That(van.CurrentWeight, Is.EqualTo(100));
            Assert.That(van.RemainingCapacity, Is.EqualTo(100));
            van.Load("Y", 50);
            Assert.That(van.CurrentWeight, Is.EqualTo(150));
            Assert.That(van.RemainingCapacity, Is.EqualTo(50));
            van.Load("Z", 50);
            Assert.That(van.CurrentWeight, Is.EqualTo(200));
            Assert.That(van.RemainingCapacity, Is.EqualTo(0));
        }

        [Test]
        public void LoadingVanOverCapacityThrowsException()
        {
            van.Load("X", 100);
            van.Load("Y", 50);
            van.Load("Z", 50);
            Assert.That(() => van.Load("DANGER", 1), Throws.InvalidOperationException);
        }
    }
}
