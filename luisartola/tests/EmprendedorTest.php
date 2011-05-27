<?php

class EmprendedorTest extends PHPUnit_Framework_TestCase
{

    /**
     * @test
     */
    function con_stub_para_varias_ciudades_elige_la_mas_Beneficiosa()
    {
        $mordor = new MercadoFake('Mordor', null, null);
        $himler = new MercadoFake('Himler', null, null);

        $mordor->setBeneficio(200);
        $himler->setBeneficio(100);

        $emprendedor = new Emprendedor();
        $emprendedor->addMercado($mordor);
        $emprendedor->addMercado($himler);

        $mejorMercado = $emprendedor->mejorMercado(array('producto1' => 50));

        $this->assertEquals('Mordor', $mejorMercado->nombre());
    }

    /**
     * @test
     */
    function sin_stub()
    {
        $preciosMordor = array(
            'Chicles' => 50,
            'Panceta' => 2
        );
        
        $preciosHimler = array(
            'Chicles' => 5,
            'Panceta' => 0
        );
        
        $mordor = new MercadoCiudad('Mordor', 200, $preciosMordor);
        $himler = new MercadoCiudad('Himler', 200, $preciosHimler);

        $emprendedor = new Emprendedor();
        $emprendedor->addMercado($mordor);
        $emprendedor->addMercado($himler);

        $carga = array(
            'Chicles' => 20,
            'Panceta' => 20
        );
        
        $mejorMercado = $emprendedor->mejorMercado($carga);
        
        $this->assertEquals('Mordor', $mejorMercado->nombre());
    }

}