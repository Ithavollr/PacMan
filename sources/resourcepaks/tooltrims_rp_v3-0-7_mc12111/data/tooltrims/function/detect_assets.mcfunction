summon minecraft:marker ~ ~ ~ {CustomName:{translate:tooltrims.title}, Tags:["tooltrims.assets_detector"]}

# send message if the name is not translated, else resets scoreboard
execute unless entity @n[type=marker, tag=tooltrims.assets_detector, name="Tool Trims"] run return run function tooltrims:detect_assets_failed
scoreboard players reset $assets_detector tooltrims.variable
kill @n[type=marker, tag=tooltrims.assets_detector]