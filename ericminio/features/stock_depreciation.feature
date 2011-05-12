Feature: Stock depreciation
  In order to choose the best market,
  as a fisherman,
  I want to known the depreciation of my stock for a market

  Scenario Outline: stock looses 1% value each km

    Given Carlos has a stock with maximum value of <value> in a market
    And Carlos is <distance> km far from this market
    Then the market will sub a <tax> to the value of the stock

    Examples:
      | value  |distance|  tax  |
      |   100  |  100   |    1  |
      |   200  |  100   |    2  |
      |   100  |  200   |    2  |
      |  1000  |  300   |   30  |