require 'spec_helper'

describe Carga do

  let(:carga) { Carga.new(:langosta => 20) }

  context 'sin perdida de calidad' do

    it "contiene kilos de diferentes tipos de marisco" do
      carga.kilos_de(:langosta).should == 20
    end
  end

  context 'con perdida de calidad' do

    let(:porcentaje_de_perdida_de_calidad) { 10 }

    it "se le pudren algunos kilos" do
      carga.sufre_un(porcentaje_de_perdida_de_calidad)
      carga.kilos_de(:langosta).should == 18
    end
  end
end
