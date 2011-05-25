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
    Given the following stock
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
    Then the best market is Lisboa


  Scenario Outline: truck charges are 5 fixed + 2 each km
    Given a <distance>
    Then the charges to rent a truck are <amount>
  Examples:
    | distance | amount |
    | 0        | 0      |
    | 1        | 7      |
    | 2        | 9      |
    | 240      | 485    |


  Scenario: choose the best balance between incomes and charges
    Given the following markets
      | Name   |
      | Madrid |
      | Lisboa |
    Given the following stock
      | Product | Quantity |
      | Vieiras | 2        |
      | Pulpo   | 3        |
    When the market conditions are
      | Product | Madrid | Lisboa |
      | Vieiras | 10     | 100    |
      | Pulpo   | 11     | 100    |
    When the markets are at the following distances
      | Name   | Distance |
      | Madrid | 0        |
      | Lisboa | 240      |
    Then stock's net incomes in the markets are
      | Name   | Value |
      | Madrid | 53    |
      | Lisboa | 15    |
    Then the best market is Madrid




  