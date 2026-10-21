# check which slots have trimmed tools
execute if items entity @s player.cursor *[minecraft:custom_data~{ "tooltrims:item": "trimmed_tool" }] run item modify entity @s player.cursor tooltrims:migration_20/trimmed_tool
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{ "tooltrims:item": "trimmed_tool" }] run item modify entity @s weapon.mainhand tooltrims:migration_20/trimmed_tool
execute if items entity @s container.* *[minecraft:custom_data~{ "tooltrims:item": "trimmed_tool" }] run function tooltrims:migration/20/inventory_trimmed_tools

# check which slots have templates
execute if items entity @s player.cursor *[minecraft:custom_data~{ "tooltrims:item": "template" },custom_model_data] run item modify entity @s player.cursor tooltrims:migration_20/templates
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{ "tooltrims:item": "template" },custom_model_data] run item modify entity @s weapon.mainhand tooltrims:migration_20/templates
execute if items entity @s container.* *[minecraft:custom_data~{ "tooltrims:item": "template" },custom_model_data] run function tooltrims:migration/20/inventory_templates