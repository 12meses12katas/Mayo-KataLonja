require 'cucumber/rspec/doubles'
require File.dirname(__FILE__) + '/../../lib/fisherman.rb'
require File.dirname(__FILE__) + '/../../lib/market.rb'


Given /^Carlos has a stock with maximum value of (\d+) in a market$/ do |value|
  @a_market = Market.new("far. Or not. It depends")
  @carlos = Fisherman.new("Carlos")
  @carlos.should_receive(:stock_value_in).with(@a_market).and_return(value.to_i)
end

And /^Carlos is (\d+) km far from this market$/ do |distance|
  @carlos.set_distance_from_market(@a_market, distance.to_i)
end

Then /^the market will sub a (\d+) to the value of the stock$/ do |tax|
  @carlos.stock_depreciation_for(@a_market).should == tax.to_i
end