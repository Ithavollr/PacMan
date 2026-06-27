execute store result storage eden:temp trader.trades.price int 1 run random value 2..16
execute store result storage eden:temp trader.trades.id int 1 run random value 1..140

function trader_trades:trades/plushies/get with storage eden:temp trader.trades
function trader_trades:trades/plushies/add with storage eden:temp trader.trades

data remove storage eden:temp trader.trades