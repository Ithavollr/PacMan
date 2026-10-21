# Generate chart trade
data modify entity @s Offers.Recipes prepend value {buyB:{id:"minecraft:book",count:1},buy:{id:"minecraft:emerald",count:14},sell:{id:"minecraft:paper",count:1},maxUses:1}
loot replace entity @s weapon.mainhand loot nova_structures:villagers/villager_emerald_counts
data modify entity @s Offers.Recipes[0].buy merge from entity @s equipment.mainhand
loot replace entity @s weapon.mainhand loot nova_structures:villagers/traveler_librarian
data modify entity @s Offers.Recipes[0].sell merge from entity @s equipment.mainhand

# Tag this level trade as being added
tag @s add trade2added

# Remove saddle
item replace entity @s saddle with air