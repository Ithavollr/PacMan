scoreboard players set @s village_names 0

execute as @s at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2
execute unless score @s village_names_msg_on matches 1 run tellraw @s [{"text":"▊ ","color":"dark_aqua","bold":true,"italic":false},{"text":"Village name title messages have been ","color":"gray","bold":false,"italic":false},{"text":"enabled","color":"green","bold":false,"italic":false},{"text":".","color":"gray","bold":false,"italic":false}]
scoreboard players set @s village_names_msg_on 1
scoreboard players set @s village_names_msg_off 0