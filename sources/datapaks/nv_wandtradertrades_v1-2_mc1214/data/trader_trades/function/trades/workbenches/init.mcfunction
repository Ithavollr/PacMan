execute store result storage eden:temp trader.trades.price int 1 run random value 2..9
execute store result storage eden:temp trader.trades.uses int 1 run random value 1..3
execute store result storage eden:temp trader.trades.id int 1 run random value 1..18

function trader_trades:trades/workbenches/get with storage eden:temp trader.trades
function trader_trades:trades/workbenches/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades