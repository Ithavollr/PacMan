execute store result storage eden:temp trader.trades.price int 1 run random value 1..8
execute store result storage eden:temp trader.trades.id int 1 run random value 1..16

function trader_trades:trades/beds/get with storage eden:temp trader.trades
function trader_trades:trades/beds/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades