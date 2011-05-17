class Emprendedor

  def initialize cartera_de_clientes
    @ganancias = {}
    cartera_de_clientes.each do |cliente|
      tiene_como_cliente_a cliente
    end
  end

  def alquila_una(furgoneta)
    @furgoneta = furgoneta
  end

  def tiene_como_cliente_a cliente
    @ganancias[cliente] = 0
    cliente.acepta_tarjeta_de_visita_de self
  end

  def compra un_monton_de_marisco
    @ganancias.keys.map do |cliente|
      @furgoneta.lleva_a(cliente, un_monton_de_marisco)
    end
  end

  def maximo_beneficio_en?
    mejor_cliente.ciudad
  end

  def cobra(cliente, nuevo_cobro)
    @ganancias[cliente] += nuevo_cobro
  end

  def paga(factura)
    @ganancias[factura.cliente] -= factura.pago
  end

  private

  def mejor_cliente
    mejor_cliente = @ganancias.first[0]
    @ganancias.each do |cliente_actual, ganancias_cliente_actual|
      mejor_cliente = cliente_actual if @ganancias[mejor_cliente] < ganancias_cliente_actual
    end
    mejor_cliente
  end
end
