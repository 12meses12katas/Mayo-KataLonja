<?php

require '../src/Lonja.php';

class LonjaTests extends PHPUnit_Framework_TestCase {

  private $lonja;

  public function setUp() {
    $this->lonja = new Lonja('Ankh Morpork', 1000, $this->getPrecios());
  }

  /**
   * @test
   */
  public function devuelve_el_precio_de_un_kg_de_percebes() {
    $this->assertEquals(10, $this->lonja->porCuantoSeVendeElLoteDe(array('percebe' => 1)));
  }

  /**
   * @test
   */
  public function devuelve_el_precio_de_un_kg_de_verdel() {
    $this->assertEquals(20, $this->lonja->porCuantoSeVendeElLoteDe(array('verdel' => 1)));
  }

  /**
   * @test
   */
  public function devuelve_su_distancia_de_tierras_gallegas() {
    $this->assertEquals(1000, $this->lonja->aQueDistanciaEsta());
  }

  /**
   * @test
   */
  public function devuelve_el_nombre_de_su_ciudad() {
    $this->assertEquals('Ankh Morpork', $this->lonja->ciudad());
  }

  private function getPrecios() {
    return array(
        'percebe' => 10,
        'verdel' => 20,
        'bakalao' => 30
    );
  }

}