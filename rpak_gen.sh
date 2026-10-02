#!/bin/bash

## Remove BS Windows metafiles
find . -name "*:Zone.Identifier" -type f -delete

## Remove assets dir & recreate
rm -rf assets_v75
mkdir -p assets_v75/assets

## Sync sources with assets, first here is "last" to load, ones farther down will overwrite
## How we build (in order of preference):
##   1. Layer: order the rsyncs so later packs overwrite earlier ones; keeps ops to a minimum
##   2. rm: prune a pack right after its rsync, when no underlying layer has files at that path
##   3. --exclude: last resort, only when an rm would also delete an underlying layer's files
## Version overlays inside a pack (e.g. 21-11/, overlay_53/) are just more layers, in pack.mcmeta order
# https://modrinth.com/resourcepack/blockpixel
# BlockPixel MUST be first, bc of the rm -rf statements!!
rsync -avh ./sources/resourcepaks/blockpixel_v2_mc12111/assets/ ./assets_v75/assets/
rm -rf ./assets_v75/assets/minecraft/blockstates
rm -rf ./assets_v75/assets/minecraft/items
rm -rf ./assets_v75/assets/minecraft/models
rm -rf ./assets_v75/assets/minecraft/sounds
rm -rf ./assets_v75/assets/minecraft/textures/block
rm -rf ./assets_v75/assets/minecraft/textures/colormap
rm -rf ./assets_v75/assets/minecraft/textures/entity
rm -rf ./assets_v75/assets/minecraft/textures/environment
rm -rf ./assets_v75/assets/minecraft/textures/font
rm -rf ./assets_v75/assets/minecraft/textures/item
rm -rf ./assets_v75/assets/minecraft/textures/mob_effect
rm -rf ./assets_v75/assets/minecraft/textures/models
rm -rf ./assets_v75/assets/minecraft/textures/particle
rm -rf ./assets_v75/assets/minecraft/textures/trims
rm -rf ./assets_v75/assets/minecraft/textures/gui/sprites/hud
# https://www.shivamzter.com/java/roundista ; Roundista is for blocks only (sources/resourcepaks/what_is_block.json)
# Bonus MUST follow Basic: it overrides Basic's dirt/grass/sand/stone blockstates
rsync -avh ./sources/resourcepaks/rdista_basic_256xR32_mc12111/assets/ ./assets_v75/assets/
# Roundista only for blocks in what_is_block.json; everything else falls back to vanilla (or a later pack)
T=./assets_v75/assets/minecraft/textures/block
rm -f $T/*_sapling* $T/*_stage[0-9]* $T/*candle* $T/*rail* $T/*tulip* $T/*dripleaf* $T/*torch* $T/*amethyst_bud* $T/amethyst_cluster* $T/pointed_dripstone_* $T/*vines* $T/vine.* $T/vine_[ns].*
rm -f $T/lantern* $T/soul_lantern* $T/jack_o_lantern* $T/carved_pumpkin* $T/pumpkin_* $T/melon_* $T/cactus_* $T/hay_block_* $T/chorus_*
rm -f $T/*_coral.* $T/*_coral_[ns].* $T/*coral_fan* $T/*_mushroom.* $T/*_mushroom_[ns].* $T/*_fungus* $T/*_roots.* $T/*_roots_[ns].* $T/crimson_roots_pot*
rm -f $T/azalea_[pst]* $T/flowering_azalea_[st]* $T/potted_* $T/bamboo_s* $T/bamboo_large_leaves*
rm -f $T/allium* $T/*_bluet* $T/*_orchid* $T/cornflower* $T/dandelion* $T/lily_* $T/oxeye_daisy* $T/poppy* $T/wither_rose* $T/rose_bush_* $T/peony_* $T/lilac_* $T/sunflower_* $T/tall_grass_* $T/large_fern_* $T/fern.* $T/fern_[ns].* $T/seagrass* $T/sugar_cane* $T/dead_bush* $T/nether_sprouts* $T/spore_blossom* $T/pink_petals_stem* $T/glow_lichen* $T/sculk_vein* $T/pale_hanging_moss*
rm -f $T/chain* $T/iron_bars* $T/end_rod* $T/ladder* $T/lever* $T/cobweb* $T/flower_pot* $T/tripwire_hook* $T/repeater* $T/comparator* $T/redstone_dust_*
rm -f ./assets_v75/assets/minecraft/models/block/*candle* ./assets_v75/assets/minecraft/models/block/*rail* ./assets_v75/assets/minecraft/models/block/ladder* ./assets_v75/assets/minecraft/models/block/end_rod* ./assets_v75/assets/minecraft/models/block/flowering_azalea.json ./assets_v75/assets/minecraft/models/block/potted_*
# https://modrinth.com/resourcepack/3d-plants
# Verv goes on top of Roundista Basic so its plants win the 27 files they share
rsync -avh --exclude='optifine' ./sources/resourcepaks/verv_plants_v1-0-7_mc12111/assets/ ./assets_v75/assets/
rm -rf ./assets_v75/assets/minecraft/textures/item
rm -rf ./assets_v75/assets/minecraft/textures/block/*leaves_top.png
rm -rf ./assets_v75/assets/minecraft/textures/block/*leaves_bottom.png
rm -rf ./assets_v75/assets/minecraft/models/block/*_leaves.json
rsync -avh ./sources/resourcepaks/rdista_foilage_256xR32_mc12111/assets/ ./assets_v75/assets/
rm -rf ./assets_v75/assets/minecraft/optifine/ctm
rsync -avh --exclude='textures/gui' ./sources/resourcepaks/rdista_bonus_256xR32_mc12111/assets/ ./assets_v75/assets/
rm -rf ./assets_v75/assets/minecraft/textures/particle
rm -rf ./assets_v75/assets/minecraft/textures/entity/boat
rm -rf ./assets_v75/assets/minecraft/textures/entity/chest_boat
rm -rf ./assets_v75/assets/minecraft/optifine/font
# https://modrinth.com/mod/continuity
# Overwrite glass for roundista with connected continuity
rsync -avh ./sources/resourcepaks/continuity_v3-0-1b1_mc12111/assets/ ./assets_v75/assets/
rm -rf ./assets_v75/assets/continuity/optifine/ctm/default/bookshelf
rm -rf ./assets_v75/assets/continuity/optifine/ctm/default/sandstone
rm -rf ./assets_v75/assets/continuity/optifine/ctm/programmer_art/bookshelf
rm -rf ./assets_v75/assets/continuity/optifine/ctm/programmer_art/sandstone
rsync -avh ./sources/resourcepaks/cglass_pane_culling_fix_mc12111/assets/ ./assets_v75/assets/
### 3D Packs +=============================##
# https://modrinth.com/resourcepack/3d-crops
rsync -avh ./sources/resourcepaks/3d_crops_v3_mc12111/assets/ ./assets_v75/assets/
# https://vanillatweaks.net/picker/resource-packs/ ; overlay_53 is the only overlay in range for format 75
rsync -avh ./sources/resourcepaks/vanilla_r250126_mc1-21-x/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/vanilla_r250126_mc1-21-x/overlay_53/assets/ ./assets_v75/assets/
# https://modrinth.com/resourcepack/mikapika-s-3d-mushrooms
rsync -avh --exclude='minecraft/textures/block/dirt.png' --exclude='minecraft/models/block/flower_pot.json' --exclude='minecraft/textures/item' --exclude='minecraft/models/item' ./sources/resourcepaks/mkpk_shrooms_v1-2-1_mc12111/assets/ ./assets_v75/assets/
rm -f ./assets_v75/assets/minecraft/textures/block/flower_pot.png
# https://modrinth.com/resourcepack/fresh-animations ; version overlays applied in pack.mcmeta order
rsync -avh ./sources/resourcepaks/freshanims_v1-10-4_mc12111/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/freshanims_v1-10-4_mc12111/20-3/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/freshanims_v1-10-4_mc12111/21-2/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/freshanims_v1-10-4_mc12111/21-5/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/freshanims_v1-10-4_mc12111/21-11/assets/ ./assets_v75/assets/
##====+ FRESH ANIMS ADDONS!! +====##
# https://modrinth.com/resourcepack/fresh-animations-emissive
rsync -avh ./sources/resourcepaks/fa_emissive_v1-6-0_mc12111/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/fa_emissive_v1-6-0_mc12111/21-6/assets/ ./assets_v75/assets/
# https://modrinth.com/resourcepack/fresh-animations-details
rsync -avh ./sources/resourcepaks/fa_details_v2-2-1_mc12111/assets/ ./assets_v75/assets/
rm -rf ./assets_v75/assets/minecraft/optifine/random/entity/zombie
rsync -avh ./sources/resourcepaks/fa_details_v2-2-1_mc12111/21-2/assets/ ./assets_v75/assets/
rsync -avh ./sources/resourcepaks/fa_details_v2-2-1_mc12111/21-5/assets/ ./assets_v75/assets/
# Fresh Animations: Spiders (bundled FreshAnimations_v1.10.4.zip is identical to freshanims_v1-10-4_mc12111)
rsync -avh ./sources/resourcepaks/fa_spiders_v2-2-0_mc12111/assets/ ./assets_v75/assets/

### always keep custom changes last..
rsync -avh ./sources/resourcepaks/custom_overlay_mc12111/assets/ ./assets_v75/assets/

cp rpack.mcmeta assets_v75/pack.mcmeta
cp pack.png assets_v75/pack.png
