require File.dirname(__FILE__) + "/../../lib/quotation.rb"

class QuotationBuilder

  def of(product)
    @product = product
    self
  end

  def at(price)
    @price = price
    self
  end

  def build
    quotation = Quotation.new
    quotation.of(@product)
    quotation.at(@price)
    quotation
  end

end