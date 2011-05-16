require 'spec_helper'

describe Marisco do

  it 'tiene un nombre' do
    Marisco.new(:nombre => :percebe).nombre.should == :percebe
  end

  it 'se vende por kilos' do
    Marisco.new(:kilos => 10).kilos.should == 10
    Marisco.new(:precio_por_kilo => 15).precio_por_kilo.should == 15
  end
end
