require 'spec_helper'

describe Factura do

  let(:pago) { stub(:pago) }
  let(:cliente) { stub(:cliente) }
  let(:factura) { Factura.new(cliente, pago) }

  it 'es debida a un cliente' do
    factura.cliente.should == cliente
  end

  it 'contiene una cantidad a pagar' do
    factura.pago.should == pago
  end
end
