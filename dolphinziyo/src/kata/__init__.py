## Kata del mes de mayo en 12meses12katas 
##              Kata Lonja
## Autor: DoLpHiN
## Fecha: 09-05-2011
## Web: http://tecnogame.co.cc
## Twitter: http://twitter.com/dolphinziyo

peso = 250;
carga = [0,0,0];
    
## Recogemos la cantidad de vieiras, pulpo y centollo transportados
while peso>200: 
        peso =0;
        print "El peso total no puede superar los 200 kg";
        carga[0] = int(raw_input("Introduzca la carga de vieiras: "))
        carga[1] = int(raw_input("Introduzca la carga de pulpo: "))
        carga[2] = int(raw_input("Introduzca la carga de centollos: "))
        for i in range(3): 
            peso += carga[i];

## Euros/kg por vieiras,pulpo y centollo respectivamente (Madrid, Barcelona y Lisboa)
precios = [[500,0,450],
           [450,120,0],
           [600,100,500]];

#Distancias:  Madrid, Barcelona, Lisboa
dists = [800,1100,600];

## Beneficios para cada ciudad: Madrid, Barcelona, Lisboa
beneficios = [[0,0,0],[0,0,0],[0,0,0]];

ciudades = ["Madrid","Barcelona","Lisboa"]

## Calculamos los beneficios
for i in range(len(dists)):
    for j in range(len(dists)):
        beneficios[i][j] += carga[i] * precios[j][i];
        
## Restamos los gastos
for i in range(len(dists)):
    for j in range(len(dists)):
        beneficios[i][j] -= 5 + (2 * (dists[j]/100));
        
## Calculamos el beneficio total por ciudad, y recogemos el mayor
max=0;  
suma = [0,0,0];
for i in range(len(dists)):
    for j in range(len(dists)):
        suma[i] += beneficios[j][i]  
    if suma[i]>max:
        valor = i;
        max = suma[i];
        
## Mostramos la ciudad más rentable
print "Ciudad de mayor rentabilidad: ",ciudades[valor]; 