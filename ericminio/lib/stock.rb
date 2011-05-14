class Stock

  attr_reader :inventory

  def initialize()
    @inventory = {}
  end

  def has(quantity, product)
    @inventory[product] = quantity
  end

  def quantity_of(product)
    @inventory[product]
  end

  def products
    @inventory.keys
  end

end