require "rspec"
require File.dirname(__FILE__) + "/market_builder.rb"
require File.dirname(__FILE__) + "/seller_builder.rb"
require File.dirname(__FILE__) + "/../lib/market.rb"
require File.dirname(__FILE__) + "/../lib/fisherman.rb"

describe "Fisherman" do

  attr_reader :madrid, :lisboa, :barcelone
  attr_reader :carlos

  before(:each) do
    @madrid = Market.new("Madrid")
    @lisboa = Market.new("Liboa")
    @barcelone = Market.new("Barcelone")

    @carlos = Fisherman.new("Carlos")
    @carlos.knows_market(@madrid)
    @carlos.knows_market(@lisboa)
    @carlos.knows_market(@barcelone)
  end

  specify "value of a stock in a market" do
    in_market(@madrid).sell_price_of("vieiras").is(1).euros_each_kilo
    in_market(@madrid).sell_price_of("pulpo").is(2).euros_each_kilo
    in_market(@madrid).sell_price_of("centollos").is(3).euros_each_kilo

    seller(@carlos).has(10).kilo_of("vieiras").to_sell
    seller(@carlos).has(20).kilo_of("pulpo").to_sell
    seller(@carlos).has(30).kilo_of("centollos").to_sell
    @carlos.stock_value_in(@madrid).should == 140
  end

  specify "truck charges are 5 fixed + 2 per km" do
    seller(@carlos).is(800).far_from(@madrid)
    @carlos.truck_charges_for(@madrid).should == 1605
  end

  specify "stock depreciation is 1% each 100 km" do
    seller(@carlos).is(800).far_from(@madrid)
    @carlos.should_receive(:stock_value_in).with(@madrid).and_return(200)
    @carlos.stock_depreciation_for(@madrid).should == 16
  end

  specify "net incomes" do
    @carlos.should_receive(:stock_value_in).with(@madrid).and_return(100)
    @carlos.should_receive(:stock_depreciation_for).with(@madrid).and_return(5)
    @carlos.should_receive(:truck_charges_for).with(@madrid).and_return(1)
    @carlos.net_incomes_in(@madrid).should == 94
  end

  specify "best market is based on net incomes" do
    @carlos.should_receive(:net_incomes_in).with(@madrid).and_return(100)
    @carlos.should_receive(:net_incomes_in).with(@lisboa).and_return(200)
    @carlos.should_receive(:net_incomes_in).with(@barcelone).and_return(300)
    @carlos.best_market.should == @barcelone
  end


  def in_market(market)
    builder = MarketBuilder.new
    builder.market = market
    builder
  end

  def seller(seller)
    builder = SellerBuilder.new
    builder.seller = seller
    builder
  end

end

