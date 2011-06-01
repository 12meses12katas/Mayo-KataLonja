#!/usr/local/bin/python
# coding: utf-8

from katalonja import Lonja
from katalonja import Asesor
import unittest

class TestLonja(unittest.TestCase):

    def testCalcularBeneficio1kgVieiraMadrid(self):
        precios = {'vieira': 500}
        carga = {'vieira': 1}
        lonja = Lonja('Madrid', precios, 0)
        self.assertEqual(500, lonja.calcularGanancia(carga))

    def testCalcularBeneficio200kgVieiraMadrid(self):
        precios = {'vieira': 500}
        carga = {'vieira': 200}
        lonja = Lonja('Madrid', precios, 0)
        self.assertEqual(100000, lonja.calcularGanancia(carga))

    def testCalcularBeneficio1kgPorProductoBarcelona(self):
        precios = {'vieira': 450, 'pulpo': 120, 'centollo' : 0}
        carga = {'vieira': 1, 'pulpo': 1, 'centollo': 1}
        lonja = Lonja('Barcelona', precios, 0)
        self.assertEqual(570, lonja.calcularGanancia(carga))

    def testCalcularBeneficioCargasDiferentesPorProductoBarcelona(self):
        precios = {'vieira': 450, 'pulpo': 120, 'centollo' : 0}
        carga = {'vieira': 10, 'pulpo': 20, 'centollo': 30}
        lonja = Lonja('Barcelona', precios, 0)
        self.assertEqual(4500 + 2400 + 0, lonja.calcularGanancia(carga))
        
    def testCalcularBeneficioCargaRealLisboa(self):
        precios = {'vieira': 600, 'pulpo': 100, 'centollo' : 500}
        carga = {'vieira': 50, 'pulpo': 100, 'centollo': 50}
        lonja = Lonja('Lisboa', precios, 0)
        self.assertEqual(30000 + 10000 + 25000, lonja.calcularGanancia(carga))

    def testCalcularPerdidasPorKilometrajeMadrid(self):
        distancia = 800
        lonja = Lonja('Madrid', {}, distancia)
        self.assertEqual(5 + 2*800, lonja.calcularPerdidasPorKilometraje())

    def testCalcularPerdidasPorKilometrajeLisboa(self):
        distancia = 600
        lonja = Lonja('Lisboa', {}, distancia)
        self.assertEqual(5 + 2*600, lonja.calcularPerdidasPorKilometraje())

    def testCalcularIndiceDepreciacionPorKilometrajeMadrid(self):
        lonja = Lonja('Madrid', {}, 800)
        self.assertEqual(1 - (800/100)*0.01, lonja.calcularIndiceDepreciacionPorKilometraje())

    def testCalcularIndiceDepreciacionPorKilometrajeBarcelona(self):
        lonja = Lonja('Barcelona', {}, 1100)
        self.assertEqual(1 - (1100/100)*0.01, lonja.calcularIndiceDepreciacionPorKilometraje())

    def testCalcularMejorCiudad(self):
        asesor = Asesor()
        carga = {'vieira': 50, 'pulpo': 100, 'centollo': 50}
        self.assertEqual('Lisboa', asesor.calcularMejorCiudad(carga))


if __name__ == "__main__":
    unittest.main()
