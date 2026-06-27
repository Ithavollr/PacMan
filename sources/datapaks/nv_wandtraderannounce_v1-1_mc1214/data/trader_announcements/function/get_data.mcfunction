execute store result storage eden:temp trader.announcement.x int 1 run data get entity @s Pos[0]
execute store result storage eden:temp trader.announcement.y int 1 run data get entity @s Pos[1]
execute store result storage eden:temp trader.announcement.z int 1 run data get entity @s Pos[2]

team join wandering_trader @s
effect give @s minecraft:glowing 15 0 true

tag @s add eden.trader.announced

execute as @a[predicate=eden:entity/is_nearby_64] run function trader_announcements:send_msg