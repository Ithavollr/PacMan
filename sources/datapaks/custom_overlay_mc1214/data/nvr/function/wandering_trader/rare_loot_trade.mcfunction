execute store result score $nvr.rare_loot.trade nvr.technical run random value 1..2

execute if score $nvr.rare_loot.trade nvr.technical matches 1 run data modify entity @s Offers.Recipes prepend value {maxUses:1,buy:{id:"minecraft:emerald",count:24},sell:{id:"minecraft:barrel",count:1, components: {"minecraft:lore": ['{"color":"gray","italic":false,"text":"Mystery Box"}'], "minecraft:container_loot": {loot_table: "nvr:trim_loot"}}}}
execute if score $nvr.rare_loot.trade nvr.technical matches 2 run data modify entity @s Offers.Recipes prepend value {maxUses:1,buy:{id:"minecraft:diamond",count:12},sell:{id:"minecraft:barrel",count:1, components: {"minecraft:lore": ['{"color":"gray","italic":false,"text":"Mystery Box"}'], "minecraft:container_loot": {loot_table: "nvr:trim_loot"}}}}
