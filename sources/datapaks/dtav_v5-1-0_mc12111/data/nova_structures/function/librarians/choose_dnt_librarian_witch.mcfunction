# Revoke advancement from player
advancement revoke @s only nova_structures:mark_witch_trader

# Tag any nearby novice librarian as a witch librarian trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_witch,tag=!dnt_librarian_witch,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_witch