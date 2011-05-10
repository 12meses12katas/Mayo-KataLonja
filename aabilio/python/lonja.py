#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Kata Mayo: Lonja <aabilo@gmail.com>


class ErrorKilos(Exception):
    '''Excepción para errores en los valores en kilos del producto'''
    def __init__(self, msg=None):
        self.__msg = msg if msg is not None else None
    def __str__(self):
        return self.__msg if self.__msg is not None else "Error general"

class Lonja(object):
    '''
        Clase Lonja. Recibe (deben de ser enteros):
            - kg_vieira   = kilogramos de vieira
            - kg_pulpo    = kilogramos de pulpo
            - kg_contollo = kilogramos de centollo 
            - kg_totales  = kilogramos totales que se pueden transportar (Opcional)
    
    '''
    
    __ciudades  = [ "Madrid", "Barcelona", "Lisboa" ]
    __distancia = { "Madrid" : 800, "Barcelona" : 1600, "Lisboa" : 600 }
    __precios   = { "Madrid" : [500, 0, 450], "Barcelona" : [450, 120, 0], "Lisboa" : [600, 100, 500] }
    __plusFurgoneta = 5
    __plusXdistancia = 2
        
    def __init__(self, kg_vieira=None, kg_pulpo=None, kg_centollo=None, kg_totales=None):
        '''Inicia los valores de en kg de vieiras, pulpos y centollos'''
        if (kg_vieira is not None and kg_pulpo is not None and kg_centollo is not None):
            if (type(kg_vieira) is int and type(kg_pulpo) is int and type(kg_centollo) is int):
                self.__kg_vieira   = kg_vieira   if kg_vieira   < 200 else None
                self.__kg_pulpo    = kg_pulpo    if kg_pulpo    < 200 else None
                self.__kg_centollo = kg_centollo if kg_centollo < 200 else None
                if kg_totales is not None:
                    if type(kg_totales) is not int:
                        raise ErrorKilos("El valor para kg_totales no es un entero")
                self.__kg_totales  = kg_totales  if kg_totales is not None else 200
            else:
                raise ErrorKilos("No todos los valores para los kilos son enteros")
        else:
            raise ErrorKilos("No se establecieron valores para os kilos")
        
        if (self.__kg_vieira is None or
                self.__kg_pulpo is None or
                self.__kg_centollo is None):
            raise ErrorKilos("Cantidad de kilos inesperada")
        elif (self.__kg_vieira + self.__kg_pulpo + self.__kg_centollo > self.__kg_totales):
            raise ErrorKilos("Cantidad máxima de kilos (%d) superada" % self.__kg_totales)
        
        self.__kilosProducto = [self.__kg_vieira, self.__kg_pulpo, self.__kg_centollo]
        # Iniciar gastos, ganancias y beneficios a 0
        self.__gastosTotales = {}; self.__gananciasFinales = {}; self.__beneficiosBrutos = {}
        for i in self.__ciudades:
            self.__gastosTotales[i] = 0
            self.__gananciasFinales[i] = 0
            self.__beneficiosBrutos[i] = 0
        
    def __devaluarPrecios(self):
        '''Devalúa los precios de los productos en relación con los kilómetros de distancia de las ciudades destino'''
        for i in self.__ciudades:
            porcntj = self.__distancia[i] / 100
            for b in range(len(self.__precios[i])):
                if self.__precios[i][b] > 0:
                    self.__precios[i][b] -= ((self.__precios[i][b] * porcntj)/100)
                self.__precios[i][b] = 0 if self.__precios[i][b] < 0 else self.__precios[i][b]
        
    def calcularRentable(self):
        '''Calcula cuál es la ciudad que generará mayor beneficio y la cantidad y los devuelve (return ciudad, beneficio)'''
        self.__devaluarPrecios() # Devalúa el precio según los kms recorridos
        for i in self.__ciudades:
            self.__gastosTotales[i] = self.__plusFurgoneta + (self.__plusXdistancia * self.__distancia[i])
            for b in range(len(self.__precios[i])):
                self.__gananciasFinales[i] += self.__precios[i][b] * self.__kilosProducto[b]
            # Se le resta los gastos a las ganancias:
            self.__beneficiosBrutos[i] = self.__gananciasFinales[i] - self.__gastosTotales[i]
        
        mayor_nombre = self.__ciudades[0]
        mayor_valor  = self.__beneficiosBrutos[mayor_nombre]
        for i in self.__ciudades:
            if self.__beneficiosBrutos[i] > mayor_valor:
                mayor_nombre = i
                mayor_valor = self.__beneficiosBrutos[i]
        
        return [mayor_nombre, mayor_valor]
