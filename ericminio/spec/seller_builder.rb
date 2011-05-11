class SellerBuilder

  attr_accessor :seller

  def has(quantity)
    @quantity = quantity
    self
  end

  def kilo_of(product)
    @product = product
    self
  end

  def to_sell
    @seller.set_quantity_for_product(@product, @quantity)
  end

  def is(km)
    @km = km
    self
  end

  def far_from(market)
    @seller.set_distance_from_market(market, @km)
  end

end