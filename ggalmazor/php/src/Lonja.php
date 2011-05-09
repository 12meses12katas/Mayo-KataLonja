<?php

class Lonja {

  private $ciudad;
  private $distancia;
  private $precios;

  public function __construct($ciudad, $distancia, $precios) {
    $this->ciudad = $ciudad;
    $this->distancia = $distancia;
    $this->precios = $precios;
  }

  public function porCuantoSeVendeElLoteDe($lote) {
    $precioLote = 0;
    foreach ($lote as $producto => $kilogramos) {
      $precioLote = $this->aCuantoEstaElKiloDe($producto) * $kilogramos;
    }
    return $precioLote;
  }
  
  public function aQueDistanciaEsta() {
    return $this->distancia;
  }
  
  public function ciudad() {
    return $this->ciudad;
  }

  private function aCuantoEstaElKiloDe($producto) {
    return $this->precios[$producto];
  }

}