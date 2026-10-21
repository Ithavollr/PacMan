# migrate items in the inventory
execute if predicate tooltrims:migration_v2/has_item run function tooltrims:migration/v2/inventory/check_items

# remove near toolsmithing tables
execute as @e[type=minecraft:armor_stand, tag=310_toolsmithing_table, distance=..7] at @s run function tooltrims:migration/v2/destroy_toolsmithing_table