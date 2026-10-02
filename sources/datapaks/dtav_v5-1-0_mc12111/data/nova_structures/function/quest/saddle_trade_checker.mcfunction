# Ticking function for the saddle to run
execute as @s[tag=!trade2added] if predicate nova_structures:quest/trade_receive_lv2 run function nova_structures:quest/add_trade_lv2
execute as @s[tag=!trade3added] if predicate nova_structures:quest/trade_receive_lv3 run function nova_structures:quest/add_trade_lv3
execute as @s[tag=!trade4added] if predicate nova_structures:quest/trade_receive_lv4 run function nova_structures:quest/add_trade_lv4
execute as @s[tag=!trade5added] if predicate nova_structures:quest/trade_receive_lv5 run function nova_structures:quest/add_trade_lv5
