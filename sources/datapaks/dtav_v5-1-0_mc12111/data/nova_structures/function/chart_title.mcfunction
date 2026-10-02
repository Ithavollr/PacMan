schedule function nova_structures:chart_precaution 1s
execute if items entity @s weapon.offhand *[minecraft:custom_model_data={strings:["dnt:chart"]}] unless items entity @s weapon.mainhand *[minecraft:custom_model_data={strings:["dnt:chart"]}] if predicate nova_structures:chart_dimension_check2 run return run function nova_structures:chart_title_failstate
execute if items entity @s weapon.mainhand *[minecraft:custom_model_data={strings:["dnt:chart"]}] if predicate nova_structures:chart_dimension_check run return run function nova_structures:chart_title_failstate
title @s actionbar {"fallback":"The chart is unfolding...","translate":"title.dnt.chart_unfold"}
