<?php

class Asesor
{

    private $ciudades = array();

    public function __construct()
    {
        $ciudades = func_get_args();
        foreach ($ciudades as $ciudad) {
            $this->ciudades[] = $ciudad;
        }
    }

    public function ciudadMayorBeneficio($carga)
    {
        $beneficios = array();
        foreach ($this->ciudades as $ciudad) {
            $beneficios[$ciudad->nombre()] = $ciudad->beneficios($carga);
        }
        arsort($beneficios);
        $ciudades_ordenadas = array_keys($beneficios);
        return $ciudades_ordenadas[0];
    }

}

