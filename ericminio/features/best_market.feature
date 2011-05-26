Feature: find the best market to sell a stock

  Scenario: no brainer when there is just one market
    Given the following markets
      | Name   |
      | Madrid |
    Then the best market is Madrid


  Scenario: choose the best price conditions
    Given the following markets
      | Name   |
      | Madrid |
      | Lisboa |
    And the following stock
      | Product | Quantity |
      | Vieiras | 2        |
      | Pulpo   | 3        |
    When the market conditions are
      | Product | Madrid | Lisboa |
      | Vieiras | 10     | 100    |
      | Pulpo   | 11     | 100    |
    Then stock's value in the markets are
      | Name   | Value |
      | Madrid | 53    |
      | Lisboa | 500   |
    And the best market is Lisboa


  Scenario Outline: stock depreciation is 1% each 100km
    Given a stock could have this <value> if it were produced locally
    When this stock comes from <distance>
    Then the value of the stock is <adjusted value>
  Examples:
    | value | distance | adjusted value |
    | 100   | 100      | 99             |
    | 100   | 200      | 98             |
    | 500   | 240      | 488            |


  Scenario Outline: truck charges are 5 fixed + 2 each km
    Given a <distance>
    Then the charges to rent a truck are <amount>
  Examples:
    | distance | amount |
    | 0        | 0      |
    | 1        | 7      |
    | 2        | 9      |
    | 240      | 485    |


  Scenario: choose the best market considering all charges
    Given the following markets
      | Name   |
      | Madrid |
      | Lisboa |
    And the following stock
      | Product | Quantity |
      | Vieiras | 2        |
      | Pulpo   | 3        |
    When the market conditions are
      | Product | Madrid | Lisboa |
      | Vieiras | 10     | 100    |
      | Pulpo   | 11     | 100    |
    And the markets are at the following distances
      | Name   | Distance |
      | Madrid | 0        |
      | Lisboa | 240      |
    Then stock's net incomes in the markets are
      | Name   | Value |
      | Madrid | 53    |
      | Lisboa | 3     |
    And the best market is Madrid




  