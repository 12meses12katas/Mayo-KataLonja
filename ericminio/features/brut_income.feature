Feature: Brut income
  In order to choose a market
  As a fisherman
  I want to know the brut income for each market

  Scenario: Find the best market
    Given Carlos has the following stock
    |Vieiras     |   50   |
    |Pulpo       |  100   |
    |Centollos   |   50   |

    And the following market conditions
    |PRODUCT     | MADRID | BARCELONA | LISBOA |
    |Vieiras     |  500   |    450    |  600   |
    |Pulpo       |    0   |    120    |  100   |
    |Centollos   |  450   |      0    |  500   |

    Then brut incomes from the markets are
    |MADRID    | 47500 |
    |BARCELONA | 34500 |
    |LISBOA    | 65000 |


