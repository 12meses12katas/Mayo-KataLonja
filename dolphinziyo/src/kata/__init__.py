## Kata del mes de mayo en 12meses12katas 
##              Kata Lonja
## Autor: DoLpHiN
## Fecha: 09-05-2011

## Carga en la furgoneta (Vieiras,Pulpo,Centollos)
carga = [50,100,50];

## Euros/kg por vieiras,pulpo y centollo respectivamente (Madrid, Barcelona y Lisboa)
precios = [[500,0,450],
           [450,120,0],
           [600,100,500]];

#Distancias:  Madrid, Barcelona, Lisboa
dists = [800,1100,600];

## Beneficios para cada ciudad: Madrid, Barcelona, Lisboa
beneficios = [[0,0,0],[0,0,0],[0,0,0]];

ciudades = ["Madrid","Barcelona","Lisboa"]

for i in range(len(dists)):
    for j in range(len(dists)):
        beneficios[i][j] += carga[i] * precios[j][i];
        
for i in range(len(dists)):
    for j in range(len(dists)):
        beneficios[i][j] -= 5 + (2 * (dists[j]/100));
        
max=0;  
suma = [0,0,0];
for i in range(len(dists)):
    for j in range(len(dists)):
        suma[i] += beneficios[j][i]  
    if suma[i]>max:
        valor = i;
        max = suma[i];
        
print "Mayor: ",ciudades[valor]; 