# from: mob/init
# @s: sanctum pillager

loot replace entity @s weapon.mainhand loot incendium:artifact/patron/holy_wrath

data modify entity @s CustomName set value '{"translate":"incendium.mob.sanctum.guardian.name","fallback":"Sanctum Guardian", "color": "#DAA520"}'
data modify entity @s HandDropChances set value [40.0f,40.0f]
data modify entity @s ArmorDropChances set value [0.0f,0.0f,0.0f,0.0f]
data modify entity @s ArmorItems set value [{id:"minecraft:golden_boots", count:1b, components: {enchantments: {levels:{'minecraft:blast_protection':15}}}}, {id:"minecraft:iron_leggings", count:1b, components: {enchantments: {levels:{'minecraft:blast_protection':15}}}}, {id:"minecraft:iron_chestplate", count:1b, components: {enchantments: {levels:{'minecraft:blast_protection':15}}}}, {id:"minecraft:netherite_helmet", count:1b, components: {enchantments: {levels:{'minecraft:blast_protection':15}}}}]
data modify entity @s PersistenceRequired set value 1b

tag @s add in.ticking_entity
effect give @s fire_resistance infinite 2 true
