execute store success score $migration tooltrims.variable run scoreboard players set $migration 310_recipe 1
execute unless score $migration tooltrims.variable matches 1 store success score $migration tooltrims.variable run scoreboard players set $migration 310_operation 1
execute unless score $migration tooltrims.variable matches 1 store success score $migration tooltrims.variable run scoreboard players set $migration 310_count 1

execute if score $migration tooltrims.variable matches 1 run schedule function tooltrims:migration/v2/load 2t