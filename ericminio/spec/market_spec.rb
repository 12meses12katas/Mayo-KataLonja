require File.dirname(__FILE__) + "/../lib/market.rb"

require File.dirname(__FILE__) + "/support/builders.rb"
include Builders

describe Market do

  before(:each) do
    @market = Market.new("a market")
  end

  it "display its name when expected as instance in assertions" do
    @market.to_s.should == "a market"
  end

  it "can hold a quotation" do
    @market.has(a(quotation.of(:octopus).at(10)))
    @market.price_of(:octopus).should == 10
  end

  it "can value a stock with one product" do
    @market.has(a(quotation.of(:octopus).at(10)))
    @market.value_of(a(stock.with(2, :octopus))).should == 20
  end

  it "can value a stock with two products" do
    @market.has(a(quotation.of(:octopus).at(10)))
    @market.has(a(quotation.of(:fish).at(20)))

    @market.value_of(a(stock().with(2, :octopus).and(1, :fish))).should == 40
  end

end


