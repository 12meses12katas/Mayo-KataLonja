<?php

require '../src/Asesor.php';
require '../src/Lonja.php';

require 'Mockery/Loader.php';
$loader = new \Mockery\Loader;
$loader->register();

use \Mockery as m;

class AsesorTests extends \PHPUnit_Framework_TestCase {

  private $lonjas = array();

  public function setUp() {
    $this->lonjas['Winterfell'] = m::mock('Lonja');
    $this->lonjas['Winterfell']->shouldReceive('ciudad')->andReturn('Winterfell');
    $this->lonjas['King\'s Landing'] = m::mock('Lonja');
    $this->lonjas['King\'s Landing']->shouldReceive('ciudad')->andReturn('King\'s Landing');
    $this->lonjas['Pentos'] = m::mock('Lonja');
    $this->lonjas['Pentos']->shouldReceive('ciudad')->andReturn('Pentos');
  }
  
  public function tearDown() {
    m::close();
  }

  /**
   * @test
   */
  public function tiene_en_cuenta_el_coste_del_desplazamiento_para_elegir_la_mejor_lonja() {
    $this->fijarDistanciaDeLonja(100, 'Winterfell');
    $this->fijarDistanciaDeLonja(200, 'King\'s Landing');
    $this->fijarDistanciaDeLonja(300, 'Pentos');
    $this->fijarLonjasConElMismoPrecio(100000);
    $asesor = new Asesor($this->lonjas, 10, 10);
    $this->assertEquals('Winterfell', $asesor->dondeVendoElLote($this->getLote()));
  }

  /**
   * @test
   */
  public function tiene_en_cuenta_el_precio_del_producto_para_elegir_la_mejor_lonja() {
    $this->fijarLonjasALaMismaDistancia(10);
    $this->fijarPrecioDeLoteEnMockDeLonja(500, 'Winterfell');
    $this->fijarPrecioDeLoteEnMockDeLonja(500, 'King\'s Landing');
    $this->fijarPrecioDeLoteEnMockDeLonja(1000, 'Pentos');
    $asesor = new Asesor($this->lonjas, 10, 10);
    $this->assertEquals('Pentos', $asesor->dondeVendoElLote($this->getLote()));
  }

  /**
   * @test
   */
  public function test_de_aceptacion() {
    $lonjas = array(
        new Lonja('Madrid', 800, array('vieiras' => 500, 'pulpo' => 0, 'centollos' => 450)),
        new Lonja('Barcelona', 1100, array('vieiras' => 450, 'pulpo' => 120, 'centollos' => 0)),
        new Lonja('Lisboa', 600, array('vieiras' => 600, 'pulpo' => 100, 'centollos' => 500))
    );
    $asesor = new Asesor($lonjas, 2, 5);
    $this->assertEquals('Lisboa', $asesor->dondeVendoElLote(array('vieiras' => 50, 'pulpo' => 100, 'centollos' => 50)));
  }

  private function fijarLonjasALaMismaDistancia($distancia) {
    $this->fijarDistanciaDeLonja($distancia, 'Winterfell');
    $this->fijarDistanciaDeLonja($distancia, 'King\'s Landing');
    $this->fijarDistanciaDeLonja($distancia, 'Pentos');
  }

  private function fijarDistanciaDeLonja($distancia, $lonja) {
    $this->lonjas[$lonja]->shouldReceive('aQueDistanciaEsta')->andReturn($distancia);
  }

  private function fijarLonjasConElMismoPrecio($precio) {
    $this->fijarPrecioDeLoteEnMockDeLonja($precio, 'Winterfell');
    $this->fijarPrecioDeLoteEnMockDeLonja($precio, 'King\'s Landing');
    $this->fijarPrecioDeLoteEnMockDeLonja($precio, 'Pentos');
  }

  private function fijarPrecioDeLoteEnMockDeLonja($precio, $lonja) {
    $this->lonjas[$lonja]->shouldReceive('porCuantoSeVendeElLoteDe')->with($this->getLote())->andReturn($precio);
  }

  private function getLote() {
    return array(
        'percebe' => 10,
        'verdel' => 10,
        'bakalao' => 10
    );
  }

}