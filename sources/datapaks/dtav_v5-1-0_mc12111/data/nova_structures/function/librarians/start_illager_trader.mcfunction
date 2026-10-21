# Remove advancement from player
advancement revoke @s only nova_structures:give_illager_trader_trade

# Tag potential librarian villagers to run functions on, and schedule a function on them the next tick
# Checking for tag "trade2added" is required to make sure the trade addition only happens once to a librarian.
execute as @e[type=villager,tag=dnt_librarian_illager,distance=..15,sort=nearest] unless entity @s[tag=trade2added] run tag @s add dnt_librarian_illager_schedule

# Scheduling the function afterwards is required because the villager's exp needs a tick to update after the advancement is triggered
schedule function nova_structures:librarians/scheduled_librarian_illager 1t