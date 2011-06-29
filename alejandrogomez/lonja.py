class Lonja:
    def __init__(self, ciudad, productos, precios, distancia):
        self._ciudad = ciudad
        self._productos_precio = dict(zip(productos, precios))
        self._distancia = distancia

    def ciudad(self):
        """Devuelve el nombre de la ciudad."""
        return self._ciudad
    
    def beneficio_neto(self, stock):
        """
        Recibe un diccionario con ``producto:cantidad``
        y devuelve el beneficio neto.
        """
        beneficio = 0
        for producto, cantidad in stock:
            beneficio += cantidad * self._productos_precio[producto]
        carga_total = sum([cantidad for producto, cantidad in stock])
        beneficio -= self.coste_viaje(carga_total)
        beneficio -= self.devaluacion_carga(beneficio, carga_total)
        return beneficio
            
    def coste_viaje(self, carga):
        """Devuelve el coste de cargar la furgoneta y recorrer distancia."""
        # 5 euros por cada carga y 2 euros por cada km
        # tengo en cuenta la ida y la vuelta
        cargas = carga / 200
        return cargas * 5 + self._distancia * 2 * (2* cargas)
        
    def devaluacion_carga(self, beneficio, kgs):
        """Devuelve la devaluacion de una carga respecto al kilometraje."""
        # se calcula como una perdida del 1 por ciento por cada 100km
        return beneficio * (self._distancia / 100 * 0.01)

        
if __name__ == "__main__":
    ciudades = ['Madrid', 'Barcelona', 'Lisboa']
    productos = ['Vieiras', 'Pulpo', 'Centollos']
    cantidades = [50, 100, 50]
    
    # Madrid
    precios_mad = [500.0, 0, 450.0]
    distancia_mad = 800
    lonja_madrid = Lonja(ciudades[0], productos, precios_mad, distancia_mad)
    # Barcelona
    precios_bcn = [450.0, 120.0, 0]
    distancia_bcn = 1100
    lonja_barcelona = Lonja(ciudades[1], productos, precios_bcn, distancia_bcn)
    # Lisboa
    precios_lis = [600.0, 100.0, 500.0]
    distancia_lis = 600
    lonja_lisboa = Lonja(ciudades[2], productos, precios_lis, distancia_lis)
    
    # Calcular beneficios
    ciudad_beneficios = {}
    stock = zip(productos, cantidades)
    ciudades_lonjas = zip(ciudades, [lonja_madrid, lonja_barcelona, lonja_lisboa])
    for ciudad, lonja in ciudades_lonjas:
        beneficio_ciudad = lonja.beneficio_neto(stock)
        ciudad_beneficios[ciudad] = beneficio_ciudad
    # Mejor ciudad
    mejor_ciudad = ciudades[0]
    for ciudad in ciudades:
        if ciudad_beneficios[ciudad] > ciudad_beneficios[mejor_ciudad]:
            mejor_ciudad = ciudad
    print "La mejor ciudad es: " + mejor_ciudad
    print "Beneficios: " + str(ciudad_beneficios[mejor_ciudad])