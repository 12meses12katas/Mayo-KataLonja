class Oferta

  attr_reader :precio_por_kilo

  def initialize(options = {:nautilus => 0})
    @precio_por_kilo = options
  end

  def creada_por(pescaderia)
    @pescaderia = pescaderia
  end

  def por(un_monton_de_marisco)
    precio_por_kilo.each do |marisco, precio|
      @pescaderia.paga(un_monton_de_marisco.kilos_de(marisco) * precio)
    end
  end
end
