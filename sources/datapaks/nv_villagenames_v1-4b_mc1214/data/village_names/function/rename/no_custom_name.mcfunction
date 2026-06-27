execute at @n[type=marker,tag=village.name] run particle minecraft:happy_villager ~ ~ ~ .4 .4 .4 0.5 10

kill @n[type=marker,tag=village.name]
kill @n[type=text_display,tag=village.name]

tag @n[type=villager,tag=eden.villagename.set,distance=..96] remove eden.villagename.set

execute as @s[gamemode=!creative] run item modify entity @s weapon.mainhand eden:used_item