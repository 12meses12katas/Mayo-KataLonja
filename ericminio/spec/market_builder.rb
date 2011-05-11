class MarketBuilder

  attr_accessor :market

  def sell_price_of(product)
    @product = product
    self
  end

  def is(price)
    @price = price
    self
  end

  def euros_each_kilo
    @market.set_price_for_product(@product, @price)
  end

end