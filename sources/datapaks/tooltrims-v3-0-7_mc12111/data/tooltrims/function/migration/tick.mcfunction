# as the player, check which migration to do
execute if score $migration tooltrims.variable matches 1 run function tooltrims:migration/v2/tick
execute if score $migration tooltrims.variable matches 2 if predicate tooltrims:migration_20/has_item run function tooltrims:migration/20/check_slots
execute if score $migration tooltrims.variable matches 3 if predicate tooltrims:migration_21/has_item run function tooltrims:migration/21/check_slots