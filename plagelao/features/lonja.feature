#encode: utf-8
Feature: Ayudar a nuestro amigo emprendedor a ganar lo máximo posible vendiendo productos Galicia Calidade

  Scenario: Un único destino
    Given una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And la siguiente cartera de clientes:
      |  Localización | Kilometros desde la lonja | Oferta por kilo de vieiras | Oferta por kilo de pulpo | Oferta por kilo de centollos |
      | Madrid        |                       800 |                        500 |                       10 |                          450 |
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Madrid"

  Scenario: Varios destinos a la misma distancia pero con distintos precios
    Given una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And la siguiente cartera de clientes:
      |  Localización | Kilometros desde la lonja | Oferta por kilo de vieiras | Oferta por kilo de pulpo | Oferta por kilo de centollos |
      | Madrid Centro |                       800 |                        500 |                       10 |                          450 |
      | MercaMadrid   |                       800 |                        500 |                      100 |                          450 |
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "MercaMadrid"

  Scenario: Varios destinos a diferente distancia pero sin perdida de calidad y con la misma oferta
    Given una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And la siguiente cartera de clientes:
      |  Localización | Kilometros desde la lonja | Oferta por kilo de vieiras | Oferta por kilo de pulpo | Oferta por kilo de centollos |
      | Madrid        |                       800 |                        500 |                     1000 |                          450 |
      | Barcelona     |                      1100 |                        500 |                     1000 |                          450 |
      | Lisboa        |                       450 |                        500 |                     1000 |                          450 |
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Lisboa"

  Scenario: Aunque Barcelona paga más y la furgoneta no me cobra por el viaje, la perdida de calidad hace que sea más rentable vender el producto a Lisboa
    Given una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 0 euros por kilometro recorrido
    And la siguiente cartera de clientes:
      |  Localización | Kilometros desde la lonja | Oferta por kilo de vieiras | Oferta por kilo de pulpo | Oferta por kilo de centollos |
      | Barcelona     |                      1100 |                        600 |                      101 |                          500 |
      | Lisboa        |                       450 |                        600 |                      100 |                          500 |
    And que la mercancia gallega pierde 1% de calidad por cada 100Km recorridos debido a un defecto en la furgoneta
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Lisboa"

  Scenario: Lisboa paga mas que Barcelona y Madrid
    Given una pequeña furgoneta que es capaz de transportar hasta 200 Kg de pescado que cuesta cargar 5 euros y que cobra 2 euros por kilometro recorrido
    And la siguiente cartera de clientes:
      |  Localización | Kilometros desde la lonja | Oferta por kilo de vieiras | Oferta por kilo de pulpo | Oferta por kilo de centollos |
      | Madrid        |                       800 |                        500 |                        0 |                          450 |
      | Barcelona     |                      1100 |                        450 |                      120 |                            0 |
      | Lisboa        |                       450 |                        600 |                      100 |                          500 |
    And que la mercancia gallega pierde 1% de calidad por cada 100Km recorridos debido a un defecto en la furgoneta
    When compro en la lonja 50 Kg de vieiras a 10 euros el kilo, 100 Kg de pulpo a 20 euros el kilo y otros 50 Kg de centollos a 30 euros el kilo
    Then para obtener el mayor beneficio debería vender esa carga de pescado y marisco a "Lisboa"
