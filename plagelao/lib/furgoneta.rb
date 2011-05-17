class Furgoneta

  attr_reader :precio_por_kilometro

  def initialize(options = {:precio_por_kilometro => 0})
    @precio_por_kilometro = options[:precio_por_kilometro]
    @porcentaje_de_perdida_de_calidad_cada_cien_kilometros = 0
  end

  def alquilada_por proveedor
    @proveedor = proveedor
  end

  def degrada_la_carga_con_un(porcentaje_cada_cien_kilometros)
    @porcentaje_de_perdida_de_calidad_cada_cien_kilometros = porcentaje_cada_cien_kilometros
  end

  def lleva_a(cliente, carga)
    @proveedor.paga factura_por_viaje_a(cliente)
    carga.sufre_una_perdida_de_calidad_del(cliente.kilometros_desde_lonja/100 * @porcentaje_de_perdida_de_calidad_cada_cien_kilometros)
    cliente.paga_al_proveedor_por(carga)
  end

  def factura_por_viaje_a(cliente)
    Factura.new(cliente, cliente.kilometros_desde_lonja * precio_por_kilometro)
  end
end
