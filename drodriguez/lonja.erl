% To solve the problem, start a Erlang REPL in the directory where this file
% is located, compile it with ``c(lonja).'' and then
% execute ``lonja:solve_problem().''.

-module(lonja).
-include_lib("eunit/include/eunit.hrl").

-export([solve_problem/0, best_profit/2, profit/3, test_all/0]).

% Constant price for loading the van.
-define(VAN_BASE_PRICE, 5).
% Price per travelled kilometer in the van.
-define(VAN_PRICE_PER_KM, 2).
% Depreciation percent every 100 travelled km.
-define(GOODS_DEPRECIATION_RATE, 0.01).

% Goods record, in kg (let's say the spanish names are alright for this)
-record(goods, {vieiras=0, pulpo=0, centollos=0}).

% Prices per kg in a city.
-record(market, {vieiras=0, pulpo=0, centollos=0}).

% City market prices
-define(MADRID, #market{vieiras=500, pulpo=0, centollos=450}).
-define(BARCELONA, #market{vieiras=450, pulpo=120, centollos=0}).
-define(LISBOA, #market{vieiras=600, pulpo=100, centollos=500}).

% City distances
-define(MADRID_DISTANCE, 800).
-define(BARCELONA_DISTANCE, 1100).
-define(LISBOA_DISTANCE, 600).

% Van load
-define(LOAD, #goods{vieiras=50, pulpo=100, centollos=50}).

%%% --- Tests ---

test_all() ->
  eunit:test(lonja).

price_adjusted_by_distance_test_() ->
  lists:map(
    fun([BasePrice, Distance, Rate, Result]) ->
      ?_assertEqual(Result,
        price_adjusted_by_distance(BasePrice, Distance, Rate))
    end,
    [
      [100, 100, 0.01, 99.0],
      [200, 100, 0.01, 198.0],
      [100, 200, 0.01, 98.0],
      [100, 100, 0.03, 97.0]
    ]
  ).

van_price_test_() ->
  lists:map(
    fun([Distance, Result]) ->
      ?_assertEqual(Result, van_price(Distance))
    end,
    [
      [0, 5],
      [1, 7],
      [2, 9],
      [10, 25],
      [100, 205]
    ]
  ).

market_earnings_test_() ->
  lists:map(
    fun([AdjustedMarket, Goods, Result]) ->
      ?_assertEqual(Result, market_earnings(AdjustedMarket, Goods))
    end,
    [
      [
        #market{vieiras=1, pulpo=0, centollos=0},
        #goods{vieiras=1, pulpo=0, centollos=0},
        1
      ],
      [
        #market{vieiras=1, pulpo=0, centollos=0},
        #goods{vieiras=0, pulpo=1, centollos=1},
        0
      ],
      [
        #market{vieiras=0, pulpo=1, centollos=0},
        #goods{vieiras=0, pulpo=1, centollos=0},
        1
      ],
      [
        #market{vieiras=0, pulpo=1, centollos=0},
        #goods{vieiras=1, pulpo=0, centollos=1},
        0
      ],
      [
        #market{vieiras=0, pulpo=0, centollos=1},
        #goods{vieiras=1, pulpo=1, centollos=0},
        0
      ],
      [
        #market{vieiras=0, pulpo=0, centollos=1},
        #goods{vieiras=0, pulpo=0, centollos=1},
        1
      ],
      [
        #market{vieiras=1, pulpo=0, centollos=0},
        #goods{vieiras=2, pulpo=0, centollos=0},
        2
      ],
      [
        #market{vieiras=2, pulpo=0, centollos=0},
        #goods{vieiras=1, pulpo=0, centollos=0},
        2
      ],
      [
        #market{vieiras=0, pulpo=0, centollos=1},
        #goods{vieiras=0, pulpo=0, centollos=2},
        2
      ],
      [
        #market{vieiras=0, pulpo=0, centollos=2},
        #goods{vieiras=0, pulpo=0, centollos=1},
        2
      ],
      [
        #market{vieiras=0, pulpo=1, centollos=0},
        #goods{vieiras=0, pulpo=2, centollos=0},
        2
      ],
      [
        #market{vieiras=0, pulpo=2, centollos=0},
        #goods{vieiras=0, pulpo=1, centollos=0},
        2
      ],
      [
        #market{vieiras=2, pulpo=5, centollos=11},
        #goods{vieiras=3, pulpo=7, centollos=13},
        184
      ]
    ]
  ).

adjust_market_price_test() ->
  ?assertMatch(#market{vieiras=99.0, pulpo=198.0, centollos=297.0},
    adjust_market_price(#market{vieiras=100, pulpo=200, centollos=300}, 100)).

profit_test() ->
  Profit = profit(
    #goods{vieiras=2, pulpo=3, centollos=5},
    #market{vieiras=7, pulpo=11, centollos=13},
    17
  ),
  ?assert(abs(Profit - 72.8096) < 0.00001).



%%% --- Implementation ---

solve_problem() ->
  best_profit(
    [
      {madrid, ?MADRID, ?MADRID_DISTANCE},
      {barcelona, ?BARCELONA, ?BARCELONA_DISTANCE},
      {lisboa, ?LISBOA, ?LISBOA_DISTANCE}
    ],
    ?LOAD
  ).

best_profit(Cities, Goods) ->
  lists:foldl(
    fun({City, Market, Distance}, {MaxCity, MaxProfit}) ->
      Profit = profit(Goods, Market, Distance),
      if
        Profit > MaxProfit  -> {City, Profit};
        Profit =< MaxProfit -> {MaxCity, MaxProfit}
      end
    end,
    {none, 0},
    Cities
  ).

profit(Goods, Market, Distance) ->
  AdjustedMarket = adjust_market_price(Market, Distance),
  Earnings = market_earnings(AdjustedMarket, Goods),
  Costs = van_price(Distance),
  Earnings - Costs.

%% -- Private --

price_adjusted_by_distance(BasePrice, Distance, Rate) ->
  BasePrice * (1.0 - Rate * Distance / 100.0).

van_price(Distance) ->
  ?VAN_BASE_PRICE + ?VAN_PRICE_PER_KM * Distance.

market_earnings(AdjustedMarket, Goods) ->
  #market{vieiras=VPrc, pulpo=PPrc, centollos=CPrc} = AdjustedMarket,
  #goods{vieiras=VQty, pulpo=PQty, centollos=CQty} = Goods,
  VPrc * VQty + PPrc * PQty + CPrc * CQty.

adjust_market_price(BaseMarket, Distance) ->
  #market{vieiras=VPrc, pulpo=PPrc, centollos=CPrc} = BaseMarket,
  #market{
    vieiras=price_adjusted_by_distance(
      VPrc, Distance, ?GOODS_DEPRECIATION_RATE
    ),
    pulpo=price_adjusted_by_distance(
      PPrc, Distance, ?GOODS_DEPRECIATION_RATE
    ),
    centollos=price_adjusted_by_distance(
      CPrc, Distance, ?GOODS_DEPRECIATION_RATE
    )
  }.
 
