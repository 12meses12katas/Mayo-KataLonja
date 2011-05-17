#encoding: utf-8
require 'spec_helper'

describe Emprendedor do
  let(:cartera_de_clientes) { [pescaderia_paca] }
  let(:pescaderia_paca) { stub(:pescapaca, :ciudad => 'Zamora',
                                           :kilometros_desde_lonja => 200,
                                           :acepta_tarjeta_de_visita_de => nil) }
  let(:emprendedor) { Emprendedor.new cartera_de_clientes}

  it 'puede tener clientes en cualquier ciudad' do
    expect{emprendedor.tiene_como_cliente_a pescaderia_paca}.to_not raise_error
  end

  it 'le da su tarjeta de visita al cliente' do
    pescaderia_paca.should_receive(:acepta_tarjeta_de_visita_de).with(emprendedor)
    emprendedor.tiene_como_cliente_a pescaderia_paca
  end

  it 'cuando cobra se apunta quien le ha pagado' do
    emprendedor.tiene_como_cliente_a pescaderia_paca
    expect{ emprendedor.cobra(pescaderia_paca, 100) }.to_not raise_error
  end

  it 'cuando paga se apunta por que' do
    factura = stub(:factura, :cliente => pescaderia_paca,
                             :pago => 10 )
    emprendedor.tiene_como_cliente_a pescaderia_paca
    expect{ emprendedor.paga(factura) }.to_not raise_error
  end

  context 'transporta el marisco' do

    let(:furgoneta) { stub(:furgoneta, :lleva_a => nil) }
    let(:un_monton_de_marisco) { stub(:un_monton_de_marisco) }

    it 'en un furgoneta alquilada' do
        emprendedor.tiene_como_cliente_a pescaderia_paca
        emprendedor.alquila_una(furgoneta)
        furgoneta.should_receive(:lleva_a).with(pescaderia_paca, un_monton_de_marisco)
        emprendedor.compra un_monton_de_marisco
      end
  end

  context 'cuando tiene clientes' do

    let(:furgoneta) { stub(:furgoneta, :lleva_a => nil) }
    let(:vieiras) { stub(:vieiras) }

    before do
        emprendedor.alquila_una(furgoneta)
        emprendedor.tiene_como_cliente_a pescaderia_paca
    end

    it 'puede comprar cualquier producto' do
      expect{emprendedor.compra(vieiras)}.to_not raise_error
    end

    context 'en varias ciudades' do
      let(:mercamadrid) { stub(:mercamadrid, :ciudad => 'Madrid',
                                             :kilometros_desde_lonja => 1,
                                             :paga_por => nil,
                                             :acepta_tarjeta_de_visita_de => nil) }

      before do
        emprendedor.tiene_como_cliente_a mercamadrid
      end

      it 'decide vender al que más le paga' do
        emprendedor.cobra(mercamadrid, 100)
        emprendedor.cobra(pescaderia_paca, 10)
        emprendedor.maximo_beneficio_en?.should == 'Madrid'
      end
    end

    context 'si solo tiene uno' do

      it 'siempre le vende a él' do
        emprendedor.maximo_beneficio_en?.should == 'Zamora'
      end
    end
  end
end
