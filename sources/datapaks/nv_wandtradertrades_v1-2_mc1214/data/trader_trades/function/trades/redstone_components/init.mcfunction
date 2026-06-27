execute store result storage eden:temp trader.trades.price int 1 run random value 3..12
execute store result storage eden:temp trader.trades.uses int 1 run random value 1..5
execute store result storage eden:temp trader.trades.id int 1 run random value 1..15

function trader_trades:trades/redstone_components/get with storage eden:temp trader.trades
function trader_trades:trades/redstone_components/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades