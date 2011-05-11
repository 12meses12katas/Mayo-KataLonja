class Market

  attr_reader :name
  attr_reader :prices

  def initialize(name)
    @name = name
    @prices = {}
  end

  def to_s
    @name
  end

  def set_price_for_product(product, price)
    @prices[product] = price
  end

  def value_of(stock)
    income = 0
    stock.each { |product, quantity| income += quantity * @prices[product] }
    income
  end

end