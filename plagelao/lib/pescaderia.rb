class Pescaderia

  attr_reader :ciudad, :kilometros_desde_lonja, :oferta

  def initialize(opciones = {:ciudad => 'Atlantis',
                             :kilometros_desde_lonja => 0,
                             :oferta => {}})
    @ciudad = opciones[:ciudad]
    @kilometros_desde_lonja = opciones[:kilometros_desde_lonja]
    @oferta = opciones[:oferta]
    oferta.creada_por(self)
  end

  def acepta_tarjeta_de_visita_de(proveedor)
    @proveedor = proveedor
  end

  def paga_al_proveedor_por(un_monton_de_marisco)
    oferta.por(un_monton_de_marisco)
  end

  def paga(coste_del_marisco)
    @proveedor.cobra(self, coste_del_marisco)
  end
end
