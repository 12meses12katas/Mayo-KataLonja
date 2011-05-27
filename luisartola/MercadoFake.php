<?php

class MercadoFake implements Mercado
{

    private $nombre;
    private $beneficio;

    function __construct($nombre, $distancia, $precios)
    {
        $this->nombre = $nombre;
    }

    function nombre()
    {
        return $this->nombre;
    }

    function setBeneficio($beneficio)
    {
        $this->beneficio = $beneficio;
    }

    function calcularBeneficio($carga)
    {
        return $this->beneficio;
    }

}