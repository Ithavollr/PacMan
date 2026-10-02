scoreboard objectives add tooltrims.variable dummy

# set $migration to 1 if Tool Trims v2.x was previously installed
execute unless score $mcversion tooltrims.variable matches 0.. run function tooltrims:migration/v2/load_check

# set $migration to 2 if Tool Trims 1.20.1 was previously installed
execute if score $mcversion tooltrims.variable matches 20 run scoreboard players set $migration tooltrims.variable 2

# set $migration to 2 if Tool Trims 1.21.1 was previously installed
execute if score $mcversion tooltrims.variable matches 21 run scoreboard players set $migration tooltrims.variable 3

scoreboard players set $mcversion tooltrims.variable 26
scoreboard objectives add tooltrims.amount dummy

# scoreboards triggered when a custom smithing template is used
scoreboard objectives add tooltrims.used_linear minecraft.used:minecraft.tadpole_spawn_egg
scoreboard objectives add tooltrims.used_tracks minecraft.used:minecraft.silverfish_spawn_egg
scoreboard objectives add tooltrims.used_charge minecraft.used:minecraft.cod_spawn_egg
scoreboard objectives add tooltrims.used_frost minecraft.used:minecraft.snow_golem_spawn_egg

# detect Tool Trims assets
execute unless score $assets_detector tooltrims.variable matches -1 at @r run function tooltrims:detect_assets