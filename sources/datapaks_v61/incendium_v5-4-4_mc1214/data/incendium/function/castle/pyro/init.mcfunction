# from: ../mob/init
# @s: pyro

data modify entity @s CustomName set value '{"translate":"incendium.mob.castle.pyro.name","fallback":"Piglin Pyromancer"}'

data modify entity @s ArmorItems[1].tag.enchantments append value {id:"minecraft:blast_protection",lvl:3s}
data modify entity @s ArmorItems[2].tag.enchantments append value {id:"minecraft:blast_protection",lvl:3s}

tag @s add in.activate_mid
