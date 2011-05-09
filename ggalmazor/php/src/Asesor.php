<?php

class Asesor {

  private $lonjas;
  private $costePorKilometro;
  private $costeDeCarga;

  public function __construct($lonjas, $costePorKilometro, $costeDeCarga) {
    $this->lonjas = $lonjas;
    $this->costePorKilometro = $costePorKilometro;
    $this->costeDeCarga = $costeDeCarga;
  }

  public function dondeVendoElLote($lote) {
    $mejorLonja = null;
    foreach ($this->lonjas as $lonja) {
      if ($mejorLonja == null) {
        $mejorLonja = $lonja;
      }
      if ($this->beneficioEnLaLonjaVendiendoLote($lonja, $lote) > $this->beneficioEnLaLonjaVendiendoLote($mejorLonja, $lote)) {
        $mejorLonja = $lonja;
      }
    }
    return $mejorLonja->ciudad();
  }

  private function beneficioEnLaLonjaVendiendoLote($lonja, $lote) {
    $costeDeTransporte = 2 * ($lonja->aQueDistanciaEsta() * $this->costePorKilometro) + $this->costeDeCarga;
    $ganancia = $lonja->porCuantoSeVendeElLoteDe($lote);
    $devaluacion = $ganancia * 0.01 * $lonja->aQueDistanciaEsta() / 100;
    $beneficio = $ganancia - $costeDeTransporte - $devaluacion;
    return $beneficio;
  }

}