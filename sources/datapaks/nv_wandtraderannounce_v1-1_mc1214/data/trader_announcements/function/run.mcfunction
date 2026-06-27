execute as @e[type=wandering_trader,tag=!eden.trader.announced] at @s run function trader_announcements:get_data

schedule function trader_announcements:run 5s