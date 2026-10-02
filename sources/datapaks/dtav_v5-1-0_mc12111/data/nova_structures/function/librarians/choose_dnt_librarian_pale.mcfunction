# Revoke advancement from player
advancement revoke @s only nova_structures:mark_pale_trader

# Tag any nearby novice librarian inside the correct structure as a pale residence librarian trader
tag @e[type=villager,distance=..5,sort=nearest,predicate=nova_structures:librarian/trade_location_pale,tag=!dnt_librarian_pale,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_pale