require File.dirname(__FILE__) + "/../lib/domain.rb"
include Domain

Before do
  @stock = Stock.new
  @lonja = Lonja.new
end


Given /^the following markets$/ do |table|
  table.hashes.each { |row|
    market      = Market.new
    market.name = row['Name']
    @lonja.add(market)
  }
end
Then /^the best market is (.*)/ do |name|
  @lonja.best_market(@stock).name.should == name
end


Given /^the following stock$/ do |table|
  table.hashes.each { |row|
    @stock.has(row['Quantity'].to_i, row['Product'])
  }
end
When /^the market conditions are$/ do |table|
  table.hashes.each { |row|
    product = row['Product']
    markets = row.keys
    markets.delete('Product')
    markets.each { |market|
      @lonja.market(market).has_quotation(product, row[market].to_i)
    }
  }
end
Then /^stock's value in the markets are$/ do |table|
  table.hashes.each { |row|
    @lonja.market(row['Name']).value_of(@stock).should == row['Value'].to_i
  }
end


Given /^a (\d+)$/ do |distance|
  @distance = distance.to_i
end
Then /^the charges to rent a truck are (\d+)$/ do |amount|
  Renter::price_of(@distance).should == amount.to_i
end


When /^the markets are at the following distances$/ do |table|
  table.hashes.each { |row|
    @lonja.set_distance(@lonja.market(row['Name']), row['Distance'].to_i)
  }
end
Then /^stock's net incomes in the markets are$/ do |table|
  table.hashes.each { |row|
    @lonja.income(@lonja.market(row['Name']), @stock).should == row['Value'].to_i
  }
end