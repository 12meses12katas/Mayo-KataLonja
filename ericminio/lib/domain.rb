module Domain

  class Lonja
    def initialize
      @markets   = []
      @distances = {}
    end

    def add(market)
      @markets << market
    end

    def market(name)
      @markets.find { |market| market.name == name }
    end

    def income(market, stock)
      market.value_of(stock) - Renter::price_of(distance_of(market))
    end

    def best_market(stock)
      best = @markets.first
      @markets.each { |market| best=market if income(market, stock)>income(best, stock) }
      best
    end

    def set_distance(market, distance)
      @distances[market] = distance
    end

    def distance_of(market)
      @distances[market].to_i
    end
  end

  class Market
    attr_writer :name
    attr_reader :name

    def initialize
      @quotations = {}
    end

    def value_of(stock)
      value = 0
      stock.products.each { |product| value += stock.quantity_of(product) * quotation_of(product) }
      value
    end

    def has_quotation(product, value)
      @quotations[product] = value
    end

    def quotation_of(product)
      @quotations[product]
    end
  end

  class Stock
    def initialize
      @inventory = {}
    end

    def products
      @inventory.keys
    end

    def has(quantity, product)
      @inventory[product] = quantity
    end

    def quantity_of(product)
      @inventory[product]
    end
  end

  class Renter

    def self.price_of(distance)
      return 0 if distance == 0
      5 + 2 * distance
    end
  end

end