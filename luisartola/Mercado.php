<?php

interface Mercado
{
    function __construct($nombre, $distancia, $precios);

    function nombre();

    function calcularBeneficio($load);
}