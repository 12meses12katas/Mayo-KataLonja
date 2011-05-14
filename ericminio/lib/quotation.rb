class Quotation

  attr_reader :product, :price
  
  def of(product)
    @product = product
  end

  def at(price)
    @price = price
  end

end