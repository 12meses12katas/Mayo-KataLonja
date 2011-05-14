class SellerBuilder

  attr_accessor :seller

  def is(km)
    @km = km
    self
  end

  def far_from(market)
    @seller.set_distance_from_market(market, @km)
  end

end