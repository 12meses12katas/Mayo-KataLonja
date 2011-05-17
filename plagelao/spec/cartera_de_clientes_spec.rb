require 'spec_helper'

describe CarteraDeClientes do

  it 'pertenece a un emprendedor' do
    emprendedor = stub(:emprendedor)
    cliente = stub(:cliente)
    cartera_de_clientes = CarteraDeClientes.new [cliente]
    emprendedor.should_receive(:tiene_como_cliente_a).with(cliente)
    cartera_de_clientes.pertenece_a emprendedor
  end
end
