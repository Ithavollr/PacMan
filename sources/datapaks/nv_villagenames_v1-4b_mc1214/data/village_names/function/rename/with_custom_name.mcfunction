execute at @n[type=marker,tag=village.name] run particle minecraft:happy_villager ~ ~ ~ .4 .4 .4 0.5 10

data modify entity @n[type=marker,tag=village.name] CustomName set from entity @s SelectedItem.components.minecraft:custom_name
data modify entity @n[type=text_display,tag=village.name] text set from entity @s SelectedItem.components.minecraft:custom_name

tag @n[type=marker,tag=village.name] add village.name.custom

execute as @s[gamemode=!creative] run item modify entity @s weapon.mainhand eden:used_item