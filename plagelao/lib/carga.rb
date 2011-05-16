class Carga

  attr_reader :kilos_de_marisco

  def initialize(kilos_de_marisco)
    @kilos_de_marisco = kilos_de_marisco
    @perdida = 0
  end

  def sufre_una_perdida_de_calidad_del(tanto_por_ciento_de_perdida)
    @perdida = tanto_por_ciento_de_perdida
  end

  def kilos_de(marisco)
    (kilos_de_marisco[marisco] * (100 - @perdida) ) / 100
  end
end
