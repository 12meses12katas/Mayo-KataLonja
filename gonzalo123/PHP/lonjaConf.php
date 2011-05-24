<?php
require_once 'lonjaInterface.php';
class LonjaConf implements LonjaInterface
{
    private $distancia = array();
    private $preciosDeVenta = array();
    private $plusCargaFurgoneta;
    private $depreciacionCargaPorKilometro;
    private $limiteCarga;

    public function establecePlusCargaFurgoneta($plus)
    {
        $this->plusCargaFurgoneta = $plus;
        return $this;
    }

    public function establecePlusPorKilometro($plus)
    {
        $this->plusPorKilometro = $plus; 
        return $this;
    }

    public function estableceDepreciacionCargaPorKilometro($depreciacion)
    {
        $this->depreciacionCargaPorKilometro = $depreciacion; 
        return $this;
    }

    public function nuevaCiudad($ciudad, $distancia, $preciosVenta)
    {
        $this->distancia[$ciudad] = $distancia;
        $this->preciosDeVenta[$ciudad] = $preciosVenta;
        return $this;
    }

    public function damePrecioVenta($mercancia, $destino)
    {
        return $this->preciosDeVenta[$destino][$mercancia];
    }

    public function dameDistancia($destino)
    {
        return $this->distancia[$destino];
    }

    public function estableceLimiteCargaFurgoneta($kg)
    {
         $this->limiteCarga = $kg;
         return $this;
    }

    public function verificaCargaTotalLimite($kg)
    {
        return ($kg > $this->limiteCarga);
    }

    public function dameDepreciacionCargaPorKilometro()
    {
        return $this->depreciacionCargaPorKilometro;
    }

    public function damePlusCargaFurgoneta()
    {
        return $this->plusCargaFurgoneta;
    }

    public function damePlusPorKilometro()
    {
        return $this->plusPorKilometro;
    }
}
