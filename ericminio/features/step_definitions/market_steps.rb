require File.dirname(__FILE__) + '/../../lib/fisherman'
require File.dirname(__FILE__) + '/../../lib/market'
require File.dirname(__FILE__) + '/../../lib/stock'

require File.dirname(__FILE__) + '/../../spec/support/builders'
include Builders


Given /^Carlos has the following stock$/ do |table|
  stock = Stock.new
  table.rows_hash.each { |product, quantity|
    stock.has(quantity.to_i, product)
  }
  @fisherman       = Fisherman.new("Carlos")
  @fisherman.stock = stock
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
      market_by(name).has(quotation.of(product).at(price.to_i).build)
    }
  }
end

When /^a market has the following conditions$/ do |table|
  @market = Market.new("a market")
  table.rows_hash.each { |product, price|
    @market.has(quotation.of(product).at(price.to_i).build)
  }
end

Then /^brut income for this market is (\d+)$/ do |expected_income|
  @fisherman.stock_value_in(@market).should == expected_income.to_i
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
