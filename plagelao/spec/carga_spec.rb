require 'spec_helper'

describe Carga do

  it "contiene kilos de diferentes tipos de marisco" do
    Carga.new(:langosta => 20).kilos_de(:langosta).should == 20
  end

  it "al degradarse se le pudren algunos kilos" do
    carga = Carga.new(:langosta => 20)
    carga.sufre_una_perdida_de_calidad_del(10)
    carga.kilos_de(:langosta).should == 18
  end
end
