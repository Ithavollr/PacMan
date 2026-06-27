$tellraw @s [$(name),{"bold":false,"color":"gray","italic":false,"text":": "},{"bold":false,"color":"gray","italic":true,"text":"$(msg)"}]

execute as @s at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

data remove storage eden:temp villager.talking