#!/bin/bash

## Remove BS Windows metafiles
find . -name "*:Zone.Identifier" -type f -delete

## Remove assets dir & recreate
rm -rf assets_v46
mkdir -p assets_v46/assets

## Sync sources with assets, first here is "last" to load, ones farther down will overwrite
# https://modrinth.com/resourcepack/blockpixel
# BlockPixel MUST be first, bc of the rm -rf statements!!
rsync -avh ./sources/resourcepaks/blockpixel_v5_mc1214/assets/ ./assets_v46/assets/
rm -rf ./assets_v46/assets/minecraft/blockstates
rm -rf ./assets_v46/assets/minecraft/models
rm -rf ./assets_v46/assets/minecraft/sounds
rm -rf ./assets_v46/assets/minecraft/textures/block
rm -rf ./assets_v46/assets/minecraft/textures/colormap
rm -rf ./assets_v46/assets/minecraft/textures/entity
rm -rf ./assets_v46/assets/minecraft/textures/environment
rm -rf ./assets_v46/assets/minecraft/textures/font
rm -rf ./assets_v46/assets/minecraft/textures/item
rm -rf ./assets_v46/assets/minecraft/textures/mob_effect
rm -rf ./assets_v46/assets/minecraft/textures/models
rm -rf ./assets_v46/assets/minecraft/textures/particle
rm -rf ./assets_v46/assets/minecraft/textures/trims
rm -rf ./assets_v46/assets/minecraft/textures/gui/sprites/hud
# https://modrinth.com/resourcepack/3d-plants
rsync -avh ./sources/resourcepaks/verv_plants_v1-0-4_mc1214/assets/ ./assets_v46/assets/
rm -rf ./assets_v46/assets/minecraft/textures/block/*leaves_top.png
rm -rf ./assets_v46/assets/minecraft/textures/block/*leaves_bottom.png
rm -rf ./assets_v46/assets/minecraft/models/block/*_leaves.json
rm -rf ./assets_v46/assets/minecraft/optifine
# https://modrinth.com/resourcepack/roundista
# Roundista MUST be next.. it overwrites too many things..
rsync -avh ./sources/resourcepaks/rdista_basic_256xR31_mc1214/assets/ ./assets_v46/assets/
find ./assets_v46/assets/minecraft/textures/block -type f -name "*glass*.png" -delete # must delete for continuity
# https://modrinth.com/mod/continuity
# Overwrite glass for roundista with connected continuity
rsync -avh ./sources/resourcepaks/continuity_v3-0-0_mc1214/assets/ ./assets_v46/assets/
rm -rf ./assets_v46/assets/continuity/optifine/ctm/default/bookshelf
rm -rf ./assets_v46/assets/continuity/optifine/ctm/default/sandstone
rm -rf ./assets_v46/assets/continuity/optifine/ctm/programmer_art/bookshelf
rm -rf ./assets_v46/assets/continuity/optifine/ctm/programmer_art/sandstone
rsync -avh ./sources/resourcepaks/cglass_pane_culling_fix_mc1214/assets/ ./assets_v46/assets/
### 3D Packs +=============================##
# https://vanillatweaks.net/picker/resource-packs/
rsync -avh ./sources/resourcepaks/vanilla_r831541_mc1-21-x/assets/ ./assets_v46/assets/
# https://modrinth.com/resourcepack/3d-dripstone
rsync -avh ./sources/resourcepaks/simple_dripstone_v1-4_mc1214/assets/ ./assets_v46/assets/
# https://modrinth.com/resourcepack/mikapika-s-3d-mushrooms
rsync -avh ./sources/resourcepaks/mkpk_shrooms_v1-2_mc1214/assets/ ./assets_v46/assets/
# https://modrinth.com/resourcepack/mase-3d-(by-nestter)
rsync -avh ./sources/resourcepaks/3d_mace_v4_mc1214/assets/ ./assets_v46/assets/
##====+ TOOL TRIMS +==============##
# https://modrinth.com/plugin/tooltrims
rsync -avh ./sources/resourcepaks/tooltrims_rp_v2-3-0b_mc1214/assets/ ./assets_v46/assets/
# https://modrinth.com/resourcepack/fresh-animations
#rsync -avh ./sources/resourcepaks/freshanims_v1-9-2/assets/ ./assets_v46/assets/
rsync -avh ./sources/resourcepaks/freshanims_v1-10-1_mc1214/assets/ ./assets_v46/assets/
##====+ FRESH ANIMS ADDONS!! +====##
# https://www.planetminecraft.com/collection/137810/fresh-animations-add-ons/
rsync -avh ./sources/resourcepaks/fa_emissive_v1-2/assets/ ./assets_v46/assets/
#rsync -avh ./sources/resourcepaks/fa_xaeros_v1-2_mc1214/assets/ ./assets_v46/assets/ # Xaero's removed...
#rsync -avh ./sources/resourcepaks/fa_quivers_v1-1/assets/ ./assets_v46/assets/ -- add for 1.21.4 when available..
rsync -avh ./sources/resourcepaks/fa_details_v2-1/assets/ ./assets_v46/assets/
#rsync -avh ./sources/resourcepaks/nitpick_creeprs_v1-1/assets/ ./assets_v46/assets/ -- add for 1.21.4 when available..
#rsync -avh ./sources/resourcepaks/fa_biome_creeprs_mc1-21-1/assets/ ./assets_v46/assets/  -- add for 1.21.4 when available..
### always keep custom changes last..
rsync -avh ./sources/resourcepaks/custom_overlay_mc1214/assets/ ./assets_v46/assets/
## Clean unneaded top-files:
rm -rf ./assets_v46/assets/detailab

cp rpack.mcmeta assets_v46/pack.mcmeta
cp pack.png assets_v46/pack.png
