<?php

require_once ('../Ciudad.php');
require_once ('../Asesor.php');

/*
  obtener la ciudad más beneficiosa.
 * beneficio = ingreso - gasto
 * diseño top - down
 * candidatos: ciudad, asesor, producto,...
 * responsabilidades: distancia, precio, calculo...
 * interfaces y colaboradores:
 * + asesor --> calcular
 * +...
 * estrategia de testeo:
 * + fijar todos los parámetros menos 1
 * parámetros_
 * --- kilos que puede transportar la furgoneta: 200
 * tipos de producto: vieiras, pulpo,centollos
 * ciudad (euros/kilogramo en vieiras, pulpo y centollos)
 * 5 euros 2*xkm´ recorridos
 * distancia a cada ciudad.
 * devaluación 1% por cada 100 km´ recorridos.
 * 
 * beneficio = 
 */

class AsesorTest extends PHPUnit_Framework_TestCase
{
    /**
     * @test
     */
    function misma_distancia_distintos_precios()
    {       
        $madrid = new Ciudad('Madrid', 500, array('Vieiras' => 10));
        $lisboa = new Ciudad('Lisboa', 500, array('Vieiras' => 1000));
        $asesor = new Asesor($madrid, $lisboa);
        $carga = array('Vieiras' =>50);
        $this->assertEquals('Lisboa', $asesor->ciudadMayorBeneficio($carga));
    }
    
    /**
     * @test
     */
    function mismos_precios_distintas_distancias()
    {
        $madrid = new Ciudad('Madrid', 50,  array('Vieiras' => 10));
        $lisboa = new Ciudad('Lisboa', 500, array('Vieiras' => 10));
        $asesor = new Asesor($madrid, $lisboa);
        $carga = array('Vieiras' =>50);
        $this->assertEquals('Madrid', $asesor->ciudadMayorBeneficio($carga));
    }

}