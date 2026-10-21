# Revoke advancement from player
advancement revoke @s only nova_structures:mark_donjon_trader

# Tag any nearby novice librarian inside the correct structure as a donjon librarian trader
tag @e[type=villager,distance=..15,sort=nearest,predicate=nova_structures:librarian/trade_location_donjon,tag=!dnt_librarian_donjon,nbt={VillagerData:{profession:"minecraft:librarian",level:1}}] add dnt_librarian_donjon