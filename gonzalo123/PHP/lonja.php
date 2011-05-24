<?php
require_once 'lonjaConf.php';

class Lonja
{
    /** @var LonjaInterface */
    private $lonjaConf;
    function __construct(LonjaInterface $lonjaConf)
    {
        $this->lonjaConf = $lonjaConf;
    }

    private $carga = array();
    private $cargaTotal = 0;

    public function cargaFurgoneta($mercancia, $kg)
    {
        $this->cargaTotal += $kg;
        if ($this->lonjaConf->verificaCargaTotalLimite($this->cargaTotal)) {
            throw new Exception("Se ha excedido el límite de carga");
        }
        if (!isset($this->carga[$mercancia])) $this->carga[$mercancia] = 0;
        $this->carga[$mercancia] += $kg;
    }

    public function dameCosteTotalPorDestino($destino)
    {
        return $this->lonjaConf->damePlusCargaFurgoneta() + 
            ($this->lonjaConf->dameDistancia($destino) * $this->lonjaConf->damePlusPorKilometro());
    }

    public function damePrecioVentaTotalPorDestino($destino)
    {
        $precio = 0;
        if (count($this->carga) > 0) {
            foreach ($this->carga as $mercancia => $kg) {
                $precioVenta = $this->lonjaConf->damePrecioVenta($mercancia, $destino);
                $precio +=  ($precioVenta - $this->depreciacion($precioVenta, $destino)) * $kg;
            }
        }
        return $precio;
    }

    public function calculaViaje($destino)
    {
        $coste  = $this->dameCosteTotalPorDestino($destino);
        $precio = $this->damePrecioVentaTotalPorDestino($destino);
        return $precio - $coste;
    }

    private function depreciacion($precioVenta, $destino)
    {
        return ($this->lonjaConf->dameDistancia($destino) / 100) * $this->lonjaConf->dameDepreciacionCargaPorKilometro() * $precioVenta;
    }

    /**
     * @param array $ciudades
     * @return string
     */
    public function dameMejorCiudadParaVender(array $ciudades)
    {
        $resultado = null;
        $beneficio = 0;
        foreach ($ciudades as $ciudad) {
            if ($this->calculaViaje($ciudad) > $beneficio) {
                $resultado = $ciudad;
            }
        }
        return $resultado;
    }
}
