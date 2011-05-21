# Comentarios a mi solucion

## Clases

+ City: Contiene los datos sobre las ciudades como el nombre, la distancia, precio de compra de los productos, etc
+ FisherMan: Contiene los kilos de carga de cada producto
+ FishMarket: La aplicación para resolver el problema
+ FishMarketTest: El test

## Log de comentarios

*20/05/2011*
He sustituido todos los Maps de datos, por un Map de Maps. La solucion me gusta menos, porque al acceder a 
un Map dentro de otro Map, retorna un ArrayList, que hay que indexar. No me gusta mucho. El problema esta en que
al tener un Map dentro de otro, al recuperar un valor a través de una clave, retorna los valores en todos los 
Maps internos para esa clave como un ArrayList. Me he equivocado al intentar solucionar la kata mediante este
procedimiento. Mas info: [Groovy Maps](http://groovy.codehaus.org/JN1035-Maps), buscar apartado "Special Notations"

*12/05/2011*
1. Las clases City y FisherMan han sido borradas
2. En lugar de utilizar objetos, he decidio utilizar Maps, porque Groovy es bastante pontente con ellos,
además, me dan la posibilidad de utilizar bastantes menos bucles, aunque todavía no he podido
deshacerme de todos ellos

*11/05/2011*
En un primer momento no veo claro cómo atajar el problema usando TDD. 
Entro de lleno sin pensar con la estructura de datos. Lo veo más como un problema de 
matemáticas a resolver que una kata, la verdad.

## Notes

Link donde se describe el formato [markdown](http://daringfireball.net/projects/markdown/basics), 
el usado en este fichero. 