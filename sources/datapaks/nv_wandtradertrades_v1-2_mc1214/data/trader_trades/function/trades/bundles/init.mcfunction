execute store result storage eden:temp trader.trades.price int 1 run random value 1..10
execute store result storage eden:temp trader.trades.id int 1 run random value 1..17

function trader_trades:trades/bundles/get with storage eden:temp trader.trades
function trader_trades:trades/bundles/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades