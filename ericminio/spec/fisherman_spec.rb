require File.dirname(__FILE__) + "/../lib/market.rb"
require File.dirname(__FILE__) + "/../lib/fisherman.rb"
require File.dirname(__FILE__) + "/../lib/stock.rb"

require File.dirname(__FILE__) + "/support/builders.rb"
include Builders

describe "Fisherman" do

  before(:each) do
    @carlos = Fisherman.new("Carlos")
  end

  specify "can have a stock" do
    stock = Stock.new
    @carlos.stock = stock
    @carlos.stock.should == stock
  end

  it "gets the value of the stock from the market" do
    market = mock()
    market.should_receive(:value_of).with(@carlos.stock)
    @carlos.stock_value_in(market)
  end

  specify "truck charges are 5 fixed + 2 per km" do
    @madrid = Market.new("Madrid")
    seller(@carlos).is(800).far_from(@madrid)
    @carlos.truck_charges_for(@madrid).should == 1605
  end

  specify "stock depreciation is 1% each 100 km" do
    @madrid = Market.new("Madrid")
    seller(@carlos).is(800).far_from(@madrid)
    @carlos.should_receive(:stock_value_in).with(@madrid).and_return(200)
    @carlos.stock_depreciation_for(@madrid).should == 16
  end

  specify "net incomes" do
    market = mock()
    @carlos.should_receive(:stock_value_in).with(market).and_return(100)
    @carlos.should_receive(:stock_depreciation_for).with(market).and_return(5)
    @carlos.should_receive(:truck_charges_for).with(market).and_return(1)
    @carlos.net_incomes_in(market)
  end

  specify "best market is based on net incomes" do
    one_market = mock()
    @carlos.knows_market(one_market)
    another_market = mock()
    @carlos.knows_market(another_market)
    @carlos.should_receive(:net_incomes_in).with(one_market).and_return(100)
    @carlos.should_receive(:net_incomes_in).with(another_market).and_return(200)
    @carlos.best_market.should == another_market
  end

end


