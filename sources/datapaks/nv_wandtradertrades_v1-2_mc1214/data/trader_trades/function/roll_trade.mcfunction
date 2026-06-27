execute store result score $select_trade eden.technical run random value 1..9

execute if score $select_trade eden.technical matches 1 run function trader_trades:trades/beds/init
execute if score $select_trade eden.technical matches 2 run function trader_trades:trades/bundles/init
execute if score $select_trade eden.technical matches 3 run function trader_trades:trades/mob_heads/init
execute if score $select_trade eden.technical matches 4 run function trader_trades:trades/potions/init
execute if score $select_trade eden.technical matches 5 run function trader_trades:trades/redstone_components/init
execute if score $select_trade eden.technical matches 6 run function trader_trades:trades/treasure_book/init
execute if score $select_trade eden.technical matches 7 run function trader_trades:trades/workbenches/init
execute if score $select_trade eden.technical matches 8 run function trader_trades:trades/miniblocks/init
execute if score $select_trade eden.technical matches 9 run function trader_trades:trades/plushies/init