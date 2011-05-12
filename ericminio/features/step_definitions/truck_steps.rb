require File.dirname(__FILE__) + '/../../lib/fisherman.rb'
require File.dirname(__FILE__) + '/../../lib/market.rb'

Given /^Carlos is (\d+) km far from a market$/ do |distance|
  @a_market = Market.new("far. Or not. It depends")
  @carlos = Fisherman.new("Carlos")
  @carlos.set_distance_from_market(@a_market, distance.to_i)
end

Then /^truck location fee is (\d+) euros to go to this market$/ do |expected_charges|
  @carlos.truck_charges_for(@a_market).should == expected_charges.to_i
end