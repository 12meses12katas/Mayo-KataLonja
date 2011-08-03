class Lonja
    attr_accessor :madrid, :barcelona, :lisboa, :quantities

  def initialize(quantities = {:vieiras => 50, :pulpo => 100, :centollos => 50})
    self.madrid    = {:name => :madrid,    :distance => 800,   :vieiras => 500, :pulpo => 0,   :centollos => 450 }
    self.barcelona = {:name => :bacerlona, :distance => 1100,  :vieiras => 450, :pulpo => 120, :centollos => 0   }
    self.lisboa    = {:name => :lisboa,    :distance => 600,   :vieiras => 600, :pulpo => 100, :centollos => 500 }
    [self.madrid, self.barcelona, self.lisboa].each do |city| 
      [:vieiras, :pulpo, :centollos].each{ |fish| city[fish] = city[fish] * (1.0 - city[:distance] * 0.0001) }
    end
    self.quantities = quantities
  end

  def best_city
    [self.madrid, self.barcelona, self.lisboa].each do |city| 
      city[:total_price] = [:vieiras, :pulpo, :centollos].inject(0){ |acum, fish| 
        acum + city[fish] *  self.quantities[fish]
      }
    end
    [self.madrid, self.barcelona, self.lisboa].sort{|a,b| b[:total_price] <=> a[:total_price]}.first[:name].to_s
  end


end