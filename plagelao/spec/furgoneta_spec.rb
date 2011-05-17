require 'spec_helper'

describe Furgoneta do

  let(:proveedor) { stub(:proveedor, :alquila_una => nil,
                                     :paga => nil) }
  let(:cliente) { stub(:cliente, :kilometros_desde_lonja => 200,
                                 :paga_al_proveedor_por => nil) }
  let(:un_monton_de_marisco) { stub(:un_monton_de_marisco, :sufre_una_perdida_de_calidad_del => nil) }
  let(:furgoneta) { Furgoneta.new(:precio_por_kilometro => 2) }

  it 'puede ser alquilada por un proveedor' do
    proveedor.should_receive(:alquila_una).with(furgoneta)
    furgoneta.alquilada_por proveedor
  end

  context 'una vez alquilada' do

    let(:factura_por_viaje) { stub(:factura_por_viaje) }

    before do
      furgoneta.degrada_la_carga_con_un(0)
      furgoneta.alquilada_por proveedor
      Factura.stub(:new => factura_por_viaje)
    end

    it 'crea una factura para el proveedor' do
      Factura.should_receive(:new)
      furgoneta.lleva_a(cliente, un_monton_de_marisco)
    end

    it 'cobra al proveedor por cada viaje' do
      proveedor.should_receive(:paga).with(factura_por_viaje)
      furgoneta.lleva_a(cliente, un_monton_de_marisco)
    end

    it 'le dice al cliente que pague al proveedor' do
      cliente.should_receive(:paga_al_proveedor_por).with(un_monton_de_marisco)
      furgoneta.lleva_a(cliente, un_monton_de_marisco)
    end

    context "debido a un defecto" do

      let(:perdida_de_calidad) { 1 }
      let(:dos_por_ciento) { 2 }

      before do
        furgoneta.degrada_la_carga_con_un(perdida_de_calidad)
      end

      it "provoca una perdida de calidad en la carga" do
        un_monton_de_marisco.should_receive(:sufre_una_perdida_de_calidad_del).with(dos_por_ciento)
        furgoneta.lleva_a(cliente, un_monton_de_marisco)
      end
    end
  end

end
