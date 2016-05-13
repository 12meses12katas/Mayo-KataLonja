using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using KataLonja;

namespace KataLonjaTests
{
    [TestClass]
    public class KataLonjaTests
    {
        Carga carga;
        Lonja lonjaBarcelona;
        Lonja lonjaMadrid;
        Lonja lonjaLisboa;
        Asesor asesor;

        [TestInitialize]
        public void Setup()
        {
            asesor = new Asesor();

            carga = new Carga();
            carga.Add("Vieira", 50);
            carga.Add("Pulpo", 100);
            carga.Add("Centollos", 50);

            lonjaBarcelona = new Lonja()
            {
                Ciudad = NombreCiudad.Barcelona,
                Distancia = 800,
                Precios = new List<ValorDeCompra>(){ 
                        new ValorDeCompra(){ Producto="Vieira", Importe=450},
                        new ValorDeCompra(){ Producto="Pulpo", Importe=120},
                        new ValorDeCompra(){ Producto="Centollos", Importe=0}
                }
            };

            lonjaMadrid = new Lonja()
            {
                Ciudad = NombreCiudad.Madrid,
                Distancia = 1100,
                Precios = new List<ValorDeCompra>(){ 
                        new ValorDeCompra(){ Producto="Vieira", Importe=500},
                        new ValorDeCompra(){ Producto="Pulpo", Importe=0},
                        new ValorDeCompra(){ Producto="Centollos", Importe=450}
                }
            };

            lonjaLisboa = new Lonja()
            {
                Ciudad = NombreCiudad.Lisboa,
                Distancia = 600,
                Precios = new List<ValorDeCompra>(){ 
                        new ValorDeCompra(){ Producto="Vieira", Importe=600},
                        new ValorDeCompra(){ Producto="Pulpo", Importe=100},
                        new ValorDeCompra(){ Producto="Centollos", Importe=500}
                }
            };


        }

        [TestMethod]
        public void Test_Ciudad_Optima_Solo_Precios()
        {
            //Arrange
            var depreciación = new Depreciación(0);
            lonjaBarcelona.Distancia = 0;
            lonjaMadrid.Distancia = 0;
            lonjaLisboa.Distancia = 0;

            //Act
            NombreCiudad ciudad = asesor.DondeVender(carga, new List<Lonja>(){lonjaLisboa,lonjaBarcelona,lonjaMadrid}, new GastoFurgoneta(), depreciación);

            //Assert
            Assert.AreEqual(NombreCiudad.Lisboa, ciudad);
        }

        [TestMethod]
        public void Test_Ciudad_Optima_Precios_Y_CargaFurgoneta_Distancias_Inventadas()
        {
            //Arrange
            var gastoFurgoneta = new GastoFurgoneta()
            {
                Fijo = 5,
                PorKilometro = 2
            };

            lonjaBarcelona.Distancia = 800;
            lonjaMadrid.Distancia = 1100;
            lonjaLisboa.Distancia = 60000;
            var depreciación = new Depreciación(0);

            //Act
            NombreCiudad ciudad = asesor.DondeVender(carga, new List<Lonja>() { lonjaLisboa, lonjaBarcelona, lonjaMadrid }, gastoFurgoneta, depreciación);

            //Assert
            Assert.AreEqual(NombreCiudad.Madrid, ciudad);
        }

        [TestMethod]
        public void Test_Ciudad_Optima_Precios_CargaFurgoneta_Y_Depreciación_100PorCien_Carga()
        {
            //Arrange
            var gastoFurgoneta = new GastoFurgoneta()
            {
                Fijo = 5,
                PorKilometro = 2
            };         
            var depreciación = new Depreciación(1);

            //Act
            NombreCiudad ciudad = asesor.DondeVender(carga, new List<Lonja>() { lonjaLisboa, lonjaBarcelona, lonjaMadrid }, gastoFurgoneta, depreciación);

            //Assert
            Assert.AreEqual(NombreCiudad.Lisboa, ciudad);
        }
    }
}
