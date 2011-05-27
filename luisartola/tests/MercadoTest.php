<?php

class MercadoTest extends PHPUnit_Framework_TestCase
{

    /**
     * @test
     */
    function con_un_solo_producto_pero_con_precio_cero__ingresos_negativos()
    {
        $mercado = new MercadoCiudad('Madrid', 0, array('Producto1' => 0));
        $actual = $mercado->calcularBeneficio(array('Producto1' => 20));
        $this->assertEquals(-5, $actual);
    }

    /**
     * @test
     */
    function con_con_un_solo_producto_y_con_precio_pero_distancia_cero_profit_igual_a_ingresos()
    {
        $mercado = new MercadoCiudad('Madrid', 0, array('Producto1' => 10));
        $actual = $mercado->calcularBeneficio(array('Producto1' => 20));
        $this->assertEquals(20 * 10 - 5, $actual);
    }

    /**
     * @test
     */
    function con_con_un_solo_producto_y_con_precio_y_con_distancia_profit_igual_ingresos_menos_gastos_menos_depreciacion()
    {
        $mercado = new MercadoCiudad('Madrid', 10, array('Producto1' => 10));
        $actual = $mercado->calcularBeneficio(array('Producto1' => 20));
        $this->assertEquals(175, $actual);
    }

    /**
     * @test
     */
    function con_varios_productos_y_varios_precios_y_con_distancia_idem_de_idem()
    {
        $precios = array(
            'Vieiras' => 10,
            'Pulpo' => 0,
            'Centollos' => 450
        );

        $mercado = new MercadoCiudad('Madrid', 800, $precios);

        $carga = array(
            'Vieiras' => 10,
            'Pulpo' => 10,
            'Centollos' => 10
        );
        
        $actual = $mercado->calcularBeneficio( $carga );
        $this->assertEquals(2627, $actual);
    }

}