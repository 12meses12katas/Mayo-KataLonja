require File.dirname(__FILE__) + "/../lib/stock.rb"

describe Stock do

  before(:each) do
    @stock = Stock.new
  end

  it "can record a product" do
    @stock.has(1, :octopus)

    @stock.products.should == [:octopus]
    @stock.quantity_of(:octopus).should == 1
  end

  it "can record several products" do
    @stock.has(1, :octopus)
    @stock.has(2, :fish)

    @stock.products.should == [:octopus, :fish]
    @stock.quantity_of(:octopus).should == 1
    @stock.quantity_of(:fish).should == 2
  end

end