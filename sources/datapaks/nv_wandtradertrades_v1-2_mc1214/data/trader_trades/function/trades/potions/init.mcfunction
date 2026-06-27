execute store result storage eden:temp trader.trades.price int 1 run random value 6..18
execute store result storage eden:temp trader.trades.id int 1 run random value 1..20

function trader_trades:trades/potions/get with storage eden:temp trader.trades
function trader_trades:trades/potions/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades