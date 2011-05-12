require File.dirname(__FILE__) + '/../../lib/fisherman.rb'
require File.dirname(__FILE__) + '/../../lib/market.rb'

Given /^([^\"]*) has the following stock$/ do |name, stock|
  @fisherman = Fisherman.new(name)
  stock.rows_hash.each { |product, quantity|
    @fisherman.set_quantity_for_product(product, quantity.to_i)
  }
end

def market_by(name)
  @fisherman.markets.select { |m| m.name == name }.first
end

Given /^the following markets conditions$/ do |table|
  table.headers.drop(1).each { |name|
    @fisherman.knows_market(Market.new(name))
  }
  table.hashes.each { |quotations|
    product = quotations.delete("PRODUCT")
    quotations.each { |name, price|
      market_by(name).set_price_for_product(product, price.to_i)
    }
  }
end

When /^a market has the following conditions$/ do |table|
  @a_market = Market.new("a market")
  table.rows_hash.each { |product, price|
      @a_market.set_price_for_product(product, price.to_i)
  }
end

Then /^brut income for this market is (\d+)$/ do |expected_income|
  @fisherman.stock_value_in(@a_market).should == expected_income.to_i
end


Then /^brut incomes from the markets are$/ do |table|
  table.rows_hash.each { |name, expected_income|
    @fisherman.stock_value_in(market_by(name)).should == expected_income.to_i
  }
end

When /^Carlos is in Galicia, far from the markets$/ do |table|
  table.rows_hash.each { |name, distance|
    @fisherman.set_distance_from_market(market_by(name), distance.to_i)
  }
end


Then /^the best choice for Carlos is ([^"]*)$/ do |name|
  @fisherman.best_market.should == market_by(name)
end
