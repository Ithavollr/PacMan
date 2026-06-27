execute store result storage eden:temp trader.trades.price int 1 run random value 2..10
execute store result storage eden:temp trader.trades.id int 1 run random value 1..57

function trader_trades:trades/miniblocks/get with storage eden:temp trader.trades
function trader_trades:trades/miniblocks/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades