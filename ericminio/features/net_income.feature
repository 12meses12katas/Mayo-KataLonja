Feature: Net income
  In order to choose the best market,
  As a fisherman,
  I want to know the net income for each market


  Scenario: Find the best market
      Given Carlos has the following stock
        |Vieiras     |   50   |
        |Pulpo       |  100   |
        |Centollos   |   50   |

      And the following markets conditions
        |PRODUCT     | MADRID | BARCELONA | LISBOA |
        |Vieiras     |  500   |    450    |  600   |
        |Pulpo       |    0   |    120    |  100   |
        |Centollos   |  450   |      0    |  500   |

      When Carlos is in Galicia, far from the markets
        |MADRID    | 800 |
        |BARCELONA |1100 |
        |LISBOA    | 600 |

      Then the best choice for Carlos is LISBOA



