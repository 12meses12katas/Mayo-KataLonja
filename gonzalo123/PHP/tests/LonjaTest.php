<?php
require_once '../lonja.php';

class LonjaTest extends PHPUnit_Framework_TestCase
{
    /** @var Lonja */
    protected $lonja;

    const VIEIRAS   = 'vieiras';
    const PULPO     = 'pulpo';
    const CENTOLLOS = 'centollos';

    const MADRID    = 'Madrid';
    const BARCELONA = 'Barcelona';
    const LISBOA    = 'Lisboa';

    protected function setUp()
    {
        $lonjaConf = new LonjaConf;
        $lonjaConf->nuevaCiudad(self::MADRID, 800, array(
            self::VIEIRAS   => 500,
            self::PULPO     => 0,
            self::CENTOLLOS => 450,
        ))->nuevaCiudad(self::BARCELONA, 1100, array(
            self::VIEIRAS   => 450,
            self::PULPO     => 120,
            self::CENTOLLOS => 0,
        ))->nuevaCiudad(self::LISBOA, 600, array(
            self::VIEIRAS   => 600,
            self::PULPO     => 100,
            self::CENTOLLOS => 500,
        ))->estableceLimiteCargaFurgoneta(200)
          ->establecePlusCargaFurgoneta(5)
          ->estableceDepreciacionCargaPorKilometro(0.01)
          ->establecePlusPorKilometro(2);

        $this->lonja = new Lonja($lonjaConf);
        $this->lonja->cargaFurgoneta(self::VIEIRAS,   50);
        $this->lonja->cargaFurgoneta(self::PULPO,     100);
        $this->lonja->cargaFurgoneta(self::CENTOLLOS, 50);
    }

    public function getDataProviderCoste()
    {
        return array(
            'coste MADRID'    => array('expected' => 1605, 'value' => self::MADRID),
            'coste BARCELONA' => array('expected' => 2205, 'value' => self::BARCELONA),
            'coste LISBOA'    => array('expected' => 1205, 'value' => self::LISBOA),
            );
    }

    /** @dataProvider getDataProviderCoste */
    public function testCoste($expected, $value)
    {
        $this->assertEquals($expected, $this->lonja->dameCosteTotalPorDestino($value));
    }

    public function getDataProviderPrecio()
    {
        return array(
            'precio MADRID'    => array('expected' => 43700, 'value' => self::MADRID),
            'precio BARCELONA' => array('expected' => 30705, 'value' => self::BARCELONA),
            'precio LISBOA'    => array('expected' => 61100, 'value' => self::LISBOA),
            );
    }

    /** @dataProvider getDataProviderPrecio */
    public function testPrecioVenta($expected, $value)
    {
        $this->assertEquals($expected, $this->lonja->damePrecioVentaTotalPorDestino($value));
    }

    public function getDataProviderTotalBeneficio()
    {
        return array(
            'beneficio MADRID'    => array('expected' => 42095, 'value' => self::MADRID),
            'beneficio BARCELONA' => array('expected' => 28500, 'value' => self::BARCELONA),
            'beneficio LISBOA'    => array('expected' => 59895, 'value' => self::LISBOA),
            );
    }

    /** @dataProvider getDataProviderTotalBeneficio */
    public function testBEneficio($expected, $value)
    {
        $this->assertEquals($expected, $this->lonja->calculaViaje($value));
    }

    public function testMejorOpcion()
    {
        $ciudades = array(self::MADRID, self::BARCELONA, self::LISBOA);
        $this->assertEquals(self::LISBOA, $this->lonja->dameMejorCiudadParaVender($ciudades));
    }
}
