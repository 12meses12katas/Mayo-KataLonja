<?php

class MercadoCiudad implements Mercado
{

    private $nombre;
    private $precios;
    private $distancia;

    function __construct($nombre, $distancia, $precios)
    {
        $this->nombre = $nombre;
        $this->distancia = $distancia;
        $this->precios = $precios;
    }

    public function nombre()
    {
        return $this->nombre;
    }

    public function calcularBeneficio($carga)
    {
        $ingresos = $this->ingresos($carga);
        $gastos = $this->gastos($carga);
        $depreciacion = $this->depreciacion($ingresos);

        return $ingresos - $gastos - $depreciacion;
    }

    private function ingresos($carga)
    {
        $ingresos = 0;
        foreach ($this->precios as $producto => $precio) {
            $ingresos += $precio * $carga[$producto];
        }
        return $ingresos;
    }

    private function gastos($carga)
    {
        return $this->distancia * 2 + 5;
    }

    private function depreciacion($ingresos)
    {
        $porcentajePerdido = round($this->distancia / 100, 0);
        return $ingresos * ($porcentajePerdido / 100);
    }

}