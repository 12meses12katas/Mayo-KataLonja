#encoding: utf-8
require 'spec_helper'

describe Pescaderia do
  let(:madrid) { stub(:madrid) }
  let(:kilometros_desde_lonja) { stub(:kilometros_desde_lonja) }
  let(:oferta) { stub(:oferta, :creada_por => nil) }
  let(:pescaderia) { Pescaderia.new(:ciudad => madrid,
                                    :kilometros_desde_lonja => kilometros_desde_lonja,
                                    :oferta => oferta) }

  it 'está en una ciudad' do
    pescaderia.ciudad.should == madrid
  end

  it 'está a una distancia' do
    pescaderia.kilometros_desde_lonja.should == kilometros_desde_lonja
  end

  it 'acepta tarjetas de visita de sus proveedores' do
    proveedor = stub(:proveedor)
    expect{ pescaderia.acepta_tarjeta_de_visita_de(proveedor) }.not_to raise_error
  end

  context 'cuando compra marisco' do
    let(:un_monton_de_marisco) { stub(:un_monton_de_marisco) }
    let(:proveedor) { stub(:proveedor, :cobra_a => nil) }

    before do
      oferta.stub(:por => 100)
      pescaderia.acepta_tarjeta_de_visita_de(proveedor)
    end

    it 'consulta a cuanto le sale el marisco segun su oferta' do
      oferta.should_receive(:por).with(un_monton_de_marisco)
      pescaderia.paga_al_proveedor_por(un_monton_de_marisco)
    end

    it 'le paga al proveedor por el marisco' do
      proveedor.should_receive(:cobra_a).with(pescaderia, 100)
      pescaderia.paga(100)
    end
  end
end
