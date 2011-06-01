Katalonja
Mayo de 2011

Objetivo final:
  encontrar la mejor lonja para vender unos productos

Resumen de escenarios:
  * Calcular ganancia teórica enviando una carga a una lonja.
  * Calcular pérdidas por transportar carga a una lonja.
  * Calcular índice de depreciación por transportar carga a una lonja.
  * Finalmente, el asesor debe calcular la lonja más rentable.

Escenario:
  Calcular la ganancia teórica al enviar varios kg de cada producto a una lonja

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
  Calcular las pérdidas por transportar carga a una lonja

  * Test A:
  Dada la lonja <ciudad>
  Que se encuentra a <distancia> km
  Cuando enviemos la furgoneta
  Entonces tendremos unas perdidas de <resultado>

Escenario:
  Calcular en índice de depreciación por kilometraje a una Lonja

  * Test A:
  Dada la lonja <ciudad>
  Que se encuentra a <distancia> km
  cuando enviemos una furgoneta
  Entonces el indice de depreciación será <resultado>

Escenario:
  El asesor debe calcular la lonja más rentable

  * Test A:
  Dado un <asesor>
  y una <carga de productos>
  cuando enviemos dicha carga a todas las <lonjas>
  Entonces la lonja más rentable será <resultado>
