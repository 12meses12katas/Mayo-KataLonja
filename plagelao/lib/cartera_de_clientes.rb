class CarteraDeClientes

  attr_reader :clientes

  def initialize clientes
    @clientes = clientes
  end
  def pertenece_a emprendedor
    clientes.each do |cliente|
      emprendedor.tiene_como_cliente_a cliente
    end
  end
end
