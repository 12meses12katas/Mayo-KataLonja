Feature: Brut income
  In order to choose the best market,
  As a fisherman,
  I want to know the brut income for a market

  Background:
    Given Carlos has the following stock
        |Vieiras     |   50   |
        |Pulpo       |  100   |
        |Centollos   |   50   |


  Scenario: brut income
    When a market has the following conditions
        |Vieiras     |  500   |
        |Pulpo       |    0   |
        |Centollos   |  450   |
    Then brut income for this market is 47500

  

