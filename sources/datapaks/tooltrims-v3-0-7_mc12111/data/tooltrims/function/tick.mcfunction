# check if migration is set
execute if score $migration tooltrims.variable matches 1.. as @a at @s run function tooltrims:migration/tick

# detect if any player has an item to convert
execute as @a[predicate=tooltrims:has_item_to_convert] run function tooltrims:convert_item/check_item

# detect any leftovers from a used custom template
execute as @e[type=marker, tag=tooltrims.leftover] run function tooltrims:leftover/check_template