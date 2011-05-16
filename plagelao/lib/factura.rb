class Factura

  attr_reader :cliente, :pago

  def initialize(cliente, pago)
    @cliente = cliente
    @pago = pago
  end

end
