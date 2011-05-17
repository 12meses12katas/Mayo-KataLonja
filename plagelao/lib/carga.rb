class Carga

  attr_reader :kilos_de_marisco

  def initialize(kilos_de_marisco)
    @kilos_de_marisco = kilos_de_marisco
    @perdida = 0
  end

  def sufre_un(tanto_por_ciento_de_perdida)
    @perdida = tanto_por_ciento_de_perdida
  end

  def kilos_de(marisco)
    kilos_de_marisco[marisco] - kilos_que_la_perdida_de_calidad_ha_echado_a_perder_de(marisco)
  end

  def kilos_que_la_perdida_de_calidad_ha_echado_a_perder_de(marisco)
    kilos_de_marisco[marisco] *  @perdida / 100
  end
end
