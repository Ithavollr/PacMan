execute if predicate tooltrims:migration_v2/has_toolsmithing_table run function tooltrims:migration/v2/inventory/toolsmithing_tables

execute if items entity @s player.cursor *[minecraft:custom_data~{ "tool_trim_smithing_template": true }] run item modify entity @s player.cursor tooltrims:migration_v2/template
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{ "tool_trim_smithing_template": true }] run item modify entity @s weapon.mainhand tooltrims:migration_v2/template
execute if items entity @s container.* *[minecraft:custom_data~{ "tool_trim_smithing_template": true }] run function tooltrims:migration/v2/inventory/templates

execute if items entity @s player.cursor *[minecraft:custom_data~{ "trimmed_tool": true }] run item modify entity @s player.cursor tooltrims:migration_v2/trimmed_tool
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{ "trimmed_tool": true }] run item modify entity @s weapon.mainhand tooltrims:migration_v2/trimmed_tool
execute if items entity @s container.* *[minecraft:custom_data~{ "trimmed_tool": true }] run function tooltrims:migration/v2/inventory/trimmed_tools