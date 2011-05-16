class Marisco

  attr_reader :nombre, :kilos, :precio_por_kilo

  def initialize(options = {:nombre => :nautilus,
                            :kilos => 0,
                            :precio_por_kilo => 0})
    @nombre = options[:nombre]
    @kilos = options[:kilos]
    @precio_por_kilo = options[:precio_por_kilo]
  end
end
