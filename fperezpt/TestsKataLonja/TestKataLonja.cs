using NUnit.Framework;


namespace KataLonja.Tests
{
    [TestFixture]
    public class TestKataLonja
    {
        Ciudad Madrid, Barcelona, Lisboa;
        Producto Vieira, Pulpo, Centollo;

        Furgoneta furgo;

        int kmMadrid, kmBarcelona, kmLisboa;
        int kgVieira, kgPulpo, kgCentollo;

        int valBrutoProductosEnMadrid, valBrutoProductosEnBarcelona, valBrutoProductosEnLisboa;
        decimal valGastosIrAMadrid, valGastosIrABarcelona, valGastosIrALisboa;


        [Test]
        public void TestNumeroCiudadesPosibles()
        {
            Assert.AreEqual(3, furgo.Ciudades.Count);
        }

        [Test]
        public void TestNumeroProductosPosibles()
        {
            Assert.AreEqual(3, furgo.Productos.Count);
        }

        [Test]
        public void TestPreciosPorCiudad()
        {
            Assert.AreEqual(3, furgo.GetPreciosCiudad(Madrid).Count);
            Assert.AreEqual(3, furgo.GetPreciosCiudad(Barcelona).Count);
            Assert.AreEqual(3, furgo.GetPreciosCiudad(Lisboa).Count);
        }

        [Test]
        public void TestPreciosPorProducto()
        {
            Assert.AreEqual(3, furgo.GetPreciosProducto(Vieira).Count);
            Assert.AreEqual(3, furgo.GetPreciosProducto(Pulpo).Count);
            Assert.AreEqual(3, furgo.GetPreciosProducto(Centollo).Count);
        }

        [Test]
        public void TestValorBrutoProductosEnCiudad()
        {
            Assert.AreEqual(valBrutoProductosEnMadrid, furgo.GetValorBrutoProductosEn(Madrid));
            Assert.AreEqual(valBrutoProductosEnBarcelona, furgo.GetValorBrutoProductosEn(Barcelona));
            Assert.AreEqual(valBrutoProductosEnLisboa, furgo.GetValorBrutoProductosEn(Lisboa));
        }

        [Test]
        public void TestGastosFijosIrACiudad()
        {
            Assert.AreEqual(valGastosIrAMadrid, furgo.GetGastosFijosPorIrA(Madrid));

            Assert.AreEqual(valGastosIrABarcelona, furgo.GetGastosFijosPorIrA(Barcelona));

            Assert.AreEqual(valGastosIrALisboa, furgo.GetGastosFijosPorIrA(Lisboa));
        }

        [Test]
        public void TestNetoVentaProductosEnCiudad()
        {
            Assert.AreEqual(valBrutoProductosEnMadrid - valGastosIrAMadrid, furgo.GetValorNetoProductosEn(Madrid));

            Assert.AreEqual(valBrutoProductosEnBarcelona - valGastosIrABarcelona, furgo.GetValorNetoProductosEn(Barcelona));

            Assert.AreEqual(valBrutoProductosEnLisboa - valGastosIrALisboa, furgo.GetValorNetoProductosEn(Lisboa));
        }

        [Test]
        public void TestMejorCiudadParaVender()
        {
            Assert.AreEqual(Lisboa, furgo.GetMejorCiudadParaVenta());
            Assert.AreEqual("Lisboa", furgo.GetMejorCiudadParaVenta().Nombre);
        }



        [TestFixtureSetUp]
        public void FixtureSetup()
        {
            kmMadrid = 800; kmBarcelona = 1100; kmLisboa = 600;
            kgVieira = 50; kgPulpo = 100; kgCentollo = 50;

            Madrid = new Ciudad("Madrid", kmMadrid);
            Barcelona = new Ciudad("Barcelona", kmBarcelona);
            Lisboa = new Ciudad("Lisboa", kmLisboa);

            Vieira = new Producto("Vieira", kgVieira);
            Pulpo = new Producto("Pulpo", kgPulpo);
            Centollo = new Producto("Centollo", kgCentollo);

            furgo = new Furgoneta(200);

            furgo.AddPrecio(Madrid, Vieira, 500);
            furgo.AddPrecio(Madrid, Pulpo, 0);
            furgo.AddPrecio(Madrid, Centollo, 450);

            furgo.AddPrecio(Barcelona, Vieira, 450);
            furgo.AddPrecio(Barcelona, Pulpo, 120);
            furgo.AddPrecio(Barcelona, Centollo, 0);

            furgo.AddPrecio(Lisboa, Vieira, 600);
            furgo.AddPrecio(Lisboa, Pulpo, 100);
            furgo.AddPrecio(Lisboa, Centollo, 500);

            valBrutoProductosEnMadrid = kgVieira * furgo.GetPrecio(Madrid, Vieira) +
                                        kgPulpo * furgo.GetPrecio(Madrid, Pulpo) +
                                        kgCentollo * furgo.GetPrecio(Madrid, Centollo);

            valBrutoProductosEnBarcelona = kgVieira * furgo.GetPrecio(Barcelona, Vieira) +
                                           kgPulpo * furgo.GetPrecio(Barcelona, Pulpo) +
                                           kgCentollo * furgo.GetPrecio(Barcelona, Centollo);

            valBrutoProductosEnLisboa = kgVieira * furgo.GetPrecio(Lisboa, Vieira) +
                                        kgPulpo * furgo.GetPrecio(Lisboa, Pulpo) +
                                        kgCentollo * furgo.GetPrecio(Lisboa, Centollo);

            valGastosIrAMadrid = 5 + (valBrutoProductosEnMadrid * 1 / 100) * kmMadrid / 100 +
                                     (2 * kmMadrid);
            valGastosIrABarcelona = 5 + (valBrutoProductosEnBarcelona * 1 / 100) * kmBarcelona / 100 +
                                        (2 * kmBarcelona);
            valGastosIrALisboa = 5 + (valBrutoProductosEnLisboa * 1 / 100) * kmLisboa / 100 +
                                     (2 * kmLisboa);
        }
    }
}
