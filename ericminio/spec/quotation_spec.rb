require File.dirname(__FILE__) + "/../lib/quotation.rb"

describe Quotation do

  before(:each) do
    @quotation = Quotation.new
  end

  it "is for a product" do
    @quotation.of(:octopus)
    @quotation.product.should == :octopus
  end

  it "has a price" do
    @quotation.at(10)
    @quotation.price.should == 10
  end

end