#!/usr/local/bin/python
# coding: utf-8

class Lonja:

    __nombre = ''
    __productosPrecios = {}
    __distancia = 0

    def __init__(self, nombre=None, productosPrecios=None, distancia=None):
        self.__nombre = nombre
        self.__productosPrecios = productosPrecios
        self.__distancia = distancia

    def getNombre(self):
        return self.__nombre

    def calcularGanancia(self, carga):
        resultado = 0
        for producto,peso in carga.items():
            resultado += peso*self.__productosPrecios[producto]
        return resultado

    def calcularPerdidasPorKilometraje(self):
        return 5 + 2*self.__distancia

    def calcularIndiceDepreciacionPorKilometraje(self):
        return 1 - (self.__distancia/100)*0.01

    def calcularBeneficio(self, carga):
        beneficioTeorico = self.calcularGanancia(carga) - self.calcularPerdidasPorKilometraje()
        return beneficioTeorico * self.calcularIndiceDepreciacionPorKilometraje()


class Asesor:
    
    __lonjas = []

    def __init__(self):
        preciosMadrid     = {'vieira': 500, 'pulpo':   0, 'centollo' : 450}
        preciosBarcelona  = {'vieira': 450, 'pulpo': 120, 'centollo' :   0}
        preciosLisboa     = {'vieira': 600, 'pulpo': 100, 'centollo' : 500}

        madrid      = Lonja('Madrid'    , preciosMadrid     , 800)
        barcelona   = Lonja('Barcelona' , preciosBarcelona  , 1100)
        lisboa      = Lonja('Lisboa'    , preciosLisboa     , 600)

        self.__lonjas.append(madrid)
        self.__lonjas.append(barcelona);
        self.__lonjas.append(lisboa)

    def calcularMejorCiudad(self, carga):
        nombreCiudadMejorLonja = ''
        beneficioMejorLonja = 0
        for lonja in self.__lonjas:
            nuevoBeneficio = lonja.calcularBeneficio(carga)
            if (nuevoBeneficio > beneficioMejorLonja):
                nombreCiudadMejorLonja = lonja.getNombre()
                beneficioMejorLonja = lonja
        return nombreCiudadMejorLonja
