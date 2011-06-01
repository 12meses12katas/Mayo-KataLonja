Katalonja
Mayo de 2011

Objetivo final:
  encontrar la mejor lonja para vender unos productos

Resumen de escenarios:
  * Calcular ganancia te�rica enviando una carga a una lonja
  * Calcular p�rdidas por transportar carga a una lonja
  * Calcular �ndice de depreciaci�n por transportar carga a una lonja
  * Finalmente, el asesor debe calcular la lonja m�s rentable

Escenario:
  Calcular la ganancia te�rica al enviar varios kg de cada producto a una lonja

  * test A:
  Dada la lonja de <ciudad>
  Cuando enviemos <cantidad> de un solo <producto>
  Entonces obtendremos una ganancia de <resultado>

  * test B:
  Dada la lonja de <ciudad>
  Cuando enviemos <cantidad> de cada <producto>
  Entonces obtendremos una ganancia de <resultado>

  * test C:
  Dada la lonja de <ciudad>
  Cuando enviemos una <carga real> de <productos>
  Entonces obtendremos una ganancia de <resultado>

Escenario:
  Calcular las p�rdidas por transportar carga a una lonja

  * Test A:
  Dada la lonja <ciudad>
  Que se encuentra a <distancia> km
  Cuando enviemos la furgoneta
  Entonces tendremos unas perdidas de <resultado>

Escenario:
  Calcular en �ndice de depreciaci�n por kilometraje a una Lonja

  * Test A:
  Dada la lonja <ciudad>
  Que se encuentra a <distancia> km
  cuando enviemos una furgoneta
  Entonces el indice de depreciaci�n ser� <resultado>

Escenario:
  El asesor debe calcular la lonja m�s rentable

  * Test A:
  Dado un <asesor>
  y una <carga de productos>
  cuando enviemos dicha carga a todas las <lonjas>
  Entonces la lonja m�s rentable ser� <resultado>
