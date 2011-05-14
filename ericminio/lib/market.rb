class Market

  attr_reader :name

  def initialize(name)
    @name       = name
    @quotations = []
  end

  def to_s
    @name
  end

  def has(quotation)
    @quotations << quotation
  end

  def price_of(product)
    @quotations.select { |quotation| quotation.product == product }.first.price
  end

  def value_of(stock)
    income = 0
    stock.products.each { |product| income += stock.quantity_of(product) * price_of(product) }
    income
  end

end