execute as @e[type=wandering_trader,tag=!eden.trades.set] at @s run function trader_trades:get_trades
schedule function trader_trades:run 3s


#data modify storage eden:wandering_trader_db trades.beds.16 set value {maxUses:1,buy:{id:"minecraft:emerald",count:5},sell:{id:"minecraft:light_gray_bed",count:1}}