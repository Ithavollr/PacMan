advancement revoke @s only nova_structures:dnt_enchant_disabler

execute if items entity @s container.* \
 *[enchantments~[{enchantments:"#nova_structures:all_dnt_enchants"}]] \
  run function nova_structures:disable_item

execute if items entity @s container.* \
 *[stored_enchantments~[{enchantments:"#nova_structures:all_dnt_enchants"}]] \
  run function nova_structures:disable_book