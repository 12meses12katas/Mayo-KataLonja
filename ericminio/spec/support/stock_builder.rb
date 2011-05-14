require File.dirname(__FILE__) + "/../../lib/stock.rb"

class StockBuilder

  attr_reader :stock

  def initialize
    @stock = Stock.new
  end

  def with(quantity, product)
    @stock.has(quantity, product)
    self
  end

  def and(quantity, product)
    with(quantity, product)
  end

  def build
    @stock
  end

end