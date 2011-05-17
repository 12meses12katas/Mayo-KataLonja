class Furgoneta

  DEFAULT_OPTIONS = {:precio_por_kilometro => 0,
                     :perdida_de_calidad => 0}
  attr_reader :precio_por_kilometro

  def initialize(options)
    current_options = DEFAULT_OPTIONS.merge(options)
    @precio_por_kilometro = current_options[:precio_por_kilometro]
    @porcentaje_de_perdida_de_calidad_cada_cien_kilometros = current_options[:perdida_de_calidad]
  end

  def alquilada_por proveedor
    @proveedor = proveedor
  end

  def lleva_a(cliente, carga)
    @proveedor.paga_una factura_por_viaje_a(cliente)
    carga.sufre_un(porcentaje_de_perdida_de_calidad_tras_recorrer(cliente.kilometros_desde_lonja))
    cliente.paga_al_proveedor_por(carga)
  end

  def factura_por_viaje_a(cliente)
    Factura.new(cliente, cliente.kilometros_desde_lonja * precio_por_kilometro)
  end

  def porcentaje_de_perdida_de_calidad_tras_recorrer(n_kilometros)
    (n_kilometros/100) * @porcentaje_de_perdida_de_calidad_cada_cien_kilometros
  end
end
