#encoding: utf-8

Given /^una pequeña furgoneta que es capaz de transportar hasta (\d+) Kg de pescado que cuesta cargar (\d+) euros y que cobra (\d+) euros por kilometro recorrido$/ do |capacidad_maxima, coste_carga, coste_por_kilometro_recorrido|
  @furgoneta = Furgoneta.new(:capacidad_maxima => capacidad_maxima.to_i,
                            :coste_carga => coste_carga.to_i,
                            :precio_por_kilometro => coste_por_kilometro_recorrido.to_i)
end

Given /^la siguiente cartera de clientes:$/ do |cartera_de_clientes|
  clientes = []
  cartera_de_clientes.rows.each do |descripcion_cliente|
    pescaderia = Pescaderia.new(:ciudad => descripcion_cliente[0],
                                :kilometros_desde_lonja => descripcion_cliente[1].to_i,
                                :oferta => Oferta.new(:vieiras => descripcion_cliente[2].to_i,
                                                      :pulpo => descripcion_cliente[3].to_i,
                                                      :centollos => descripcion_cliente[4].to_i))
    clientes << pescaderia
  end
  @cartera_de_clientes = CarteraDeClientes.new clientes
end

Given /^que la mercancia gallega pierde (\d+)% de calidad por cada 100Km recorridos debido a un defecto en la furgoneta$/ do |perdida_de_calidad_cada_cien_kilometros|
  @furgoneta.degrada_la_carga_con_un(perdida_de_calidad_cada_cien_kilometros.to_i)
end

When /^compro en la lonja (\d+) Kg de vieiras a (\d+) euros el kilo, (\d+) Kg de pulpo a (\d+) euros el kilo y otros (\d+) Kg de centollos a (\d+) euros el kilo$/ do |kilos_vieiras, precio_kilo_vieiras, kilos_pulpo, precio_kilo_pulpo, kilos_centollos, precio_kilo_centollos|
  @emprendedor = Emprendedor.con @cartera_de_clientes, @furgoneta
  carga = Carga.new(:vieiras => kilos_vieiras.to_i,
                    :pulpo => kilos_pulpo.to_i,
                    :centollos => kilos_centollos.to_i)
  @emprendedor.compra carga
end

Then /^para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "([^"]*)"$/ do |destino|
  @emprendedor.maximo_beneficio_en?.should == destino
  #@emprendedor.should vender_en destino
end
