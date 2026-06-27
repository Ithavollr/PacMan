function trader_trades:trades/mob_heads/init

execute if predicate eden:percentages/30 run function trader_trades:roll_trade
execute if predicate eden:percentages/25 run function trader_trades:roll_trade
execute if predicate eden:percentages/20 run function trader_trades:roll_trade
execute if predicate eden:percentages/15 run function trader_trades:roll_trade

tag @s add eden.trades.set