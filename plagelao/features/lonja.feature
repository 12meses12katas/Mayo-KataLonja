#encode: utf-8
Feature: Ayudar a nuestro amigo emprendedor a ganar lo máximo posible vendiendo productos Galicia Calidade

  Scenario: Un único destino
    Given que soy un emprendedor gallego
    And una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And un posible cliente en "Madrid"(800km) que compra vieiras a 500 euros el kilo, pulpo a 10 euros el kilo y centollos a 450
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Madrid"

  Scenario: Varios destinos a la misma distancia pero con distintos precios
    Given que soy un emprendedor gallego
    And una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And un posible cliente en "Madrid Centro"(800km) que compra vieiras a 500 euros el kilo, pulpo a 10 euros el kilo y centollos a 450
    And un posible cliente en "MercaMadrid"(800km) que compra vieiras a 500 euros el kilo, pulpo a 100 euros el kilo y centollos a 450
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "MercaMadrid"

  Scenario: Varios destinos a diferente distancia pero sin perdida de calidad y con la misma oferta
    Given que soy un emprendedor gallego
    And una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And un posible cliente en "Madrid"(800km) que compra vieiras a 500 euros el kilo, pulpo a 1000 euros el kilo y centollos a 450
    And un posible cliente en "Barcelona"(1100km) que compra vieiras a 500 euros el kilo, pulpo a 1000 euros el kilo y centollos a 450
    And un posible cliente en "Lisboa"(450km) que compra vieiras a 500 euros el kilo, pulpo a 1000 euros el kilo y centollos a 450
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Lisboa"

  Scenario: Aunque Barcelona paga más, la perdida de calidad hace que sea más rentable vender el producto a Lisboa
    Given que soy un emprendedor gallego
    And una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And un posible cliente en "Barcelona"(1100km) que compra vieiras a 600 euros el kilo, pulpo a 101 euros el kilo y centollos a 500
    And un posible cliente en "Lisboa"(450km) que compra vieiras a 600 euros el kilo, pulpo a 100 euros el kilo y centollos a 500
    And que la mercancia gallega pierde 1% de calidad por cada 100Km recorridos debido a un defecto en la furgoneta
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Lisboa"

  Scenario: Lisboa paga mas que Barcelona y Madrid
    Given que soy un emprendedor gallego
    And una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And un posible cliente en "Madrid"(800km) que compra vieiras a 500 euros el kilo, pulpo a 0 euros el kilo y centollos a 450
    And un posible cliente en "Barcelona"(1100km) que compra vieiras a 450 euros el kilo, pulpo a 120 euros el kilo y centollos a 0
    And un posible cliente en "Lisboa"(450km) que compra vieiras a 600 euros el kilo, pulpo a 100 euros el kilo y centollos a 500
    And que la mercancia gallega pierde 1% de calidad por cada 100Km recorridos debido a un defecto en la furgoneta
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Lisboa"
