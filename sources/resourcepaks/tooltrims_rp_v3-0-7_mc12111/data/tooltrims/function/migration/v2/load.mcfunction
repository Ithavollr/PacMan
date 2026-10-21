# warning message
tellraw @a [{text:"[Tool Trims] Custom items from previous versions of the data pack will be updated automically in your inventory.", color:"yellow"}]

# remove old scoreboards and fake players
scoreboard objectives remove update_item
scoreboard objectives remove 310_count
scoreboard objectives remove 310_recipe

scoreboard objectives remove 310_slot_update
scoreboard objectives remove 310_slot_timer
scoreboard objectives remove 310_slot1
scoreboard objectives remove 310_slot2
scoreboard objectives remove 310_slot3

scoreboard objectives remove 310_result_count
scoreboard objectives remove 310_operation
scoreboard players reset .310_40 310_operation
scoreboard players reset .310_combination 310_operation
scoreboard players reset .310_trim 310_operation
scoreboard players reset .310_template 310_operation
scoreboard players reset .310_check_combination 310_operation
scoreboard players reset .310_check_template 310_operation
scoreboard players reset .310_check_complete 310_operation
scoreboard objectives remove 310_combination
scoreboard objectives remove 310_template
scoreboard objectives remove 310_rp_missing