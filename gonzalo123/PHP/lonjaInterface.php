<?php
interface LonjaInterface
{
    public function establecePlusCargaFurgoneta($plus);
    public function establecePlusPorKilometro($plus);
    public function estableceDepreciacionCargaPorKilometro($depreciacion);
    public function nuevaCiudad($ciudad, $distancia, $preciosVenta);
    public function damePrecioVenta($mercancia, $destino);
    public function dameDistancia($destino);
    public function estableceLimiteCargaFurgoneta($kg);
    public function verificaCargaTotalLimite($kg);
    public function dameDepreciacionCargaPorKilometro();
    public function damePlusCargaFurgoneta();
    public function damePlusPorKilometro();
}
