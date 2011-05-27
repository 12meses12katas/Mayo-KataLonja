<?php

class Emprendedor
{

    private $mercados = array();

    public function addMercado(Mercado $mercado)
    {
        $this->mercados[] = $mercado;
    }

    public function mejorMercado($carga)
    {
        $beneficios = array();
        foreach ($this->mercados as $mercado) {
            $beneficios[$mercado->calcularBeneficio($carga)] = $mercado;
        }

        ksort($beneficios);
        return array_pop($beneficios);
    }

}

