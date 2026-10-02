advancement revoke @s only nova_structures:tech_enchant_remover

execute if items entity @s container.* \
 *[enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:1}]] \
  run function nova_structures:tech_enchant_remove/item_1

execute if items entity @s container.* \
 *[enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:2}]] \
  run function nova_structures:tech_enchant_remove/item_2

execute if items entity @s container.* \
 *[enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:3}]] \
  run function nova_structures:tech_enchant_remove/item_3

execute if items entity @s container.* \
 *[enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:4}]] \
  run function nova_structures:tech_enchant_remove/item_4

execute if items entity @s container.* \
 *[enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:5}]] \
  run function nova_structures:tech_enchant_remove/item_5

execute if items entity @s container.* \
 *[stored_enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:1}]] \
  run function nova_structures:tech_enchant_remove/book_1

execute if items entity @s container.* \
 *[stored_enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:2}]] \
  run function nova_structures:tech_enchant_remove/book_2

execute if items entity @s container.* \
 *[stored_enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:3}]] \
  run function nova_structures:tech_enchant_remove/book_3

execute if items entity @s container.* \
 *[stored_enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:4}]] \
  run function nova_structures:tech_enchant_remove/book_4

execute if items entity @s container.* \
 *[stored_enchantments~[{enchantments:"#nova_structures:non_survival_enchants",levels:5}]] \
  run function nova_structures:tech_enchant_remove/book_5