Feature: Truck charges
  In order to choose the best market,
  as a fisherman,
  I want to know how much it will cost me to go to a market

  Scenario Outline: renting a truck is 5 fixed + 1 each km

    Given Carlos is <distance> km far from a market
    Then truck location fee is <amount> euros to go to this market

    Examples:
      |distance|amount|
      |    0   |    5 |
      |    1   |    7 |
      |    2   |    9 |
      |   10   |   25 |

