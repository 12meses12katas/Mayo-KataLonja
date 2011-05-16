require 'spec_helper'

describe Oferta do
  let(:pescaderia) { stub(:pescaderia) }
  let(:oferta) { Oferta.new(:cigalas => 10) }
  let(:un_monton_de_marisco) { stub(:un_monton_de_marisco, :kilos_de => 10) }

  before do
    oferta.creada_por(pescaderia)
  end

  it 'paga una cantidad por el marisco' do
    pescaderia.should_receive(:paga).with(100)
    oferta.por(un_monton_de_marisco)
  end
end
