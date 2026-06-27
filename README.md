![Package](https://github.com/Ithavollr/PacMan/actions/workflows/makefile.yml/badge.svg)
![Package](https://github.com/Ithavollr/PacMan/actions/workflows/runserver.yml/badge.svg)

# PacMan
Merge all the Minecraft Packs :package:  
This repository automatically generates and hosts the latest data & resource packs for Ithavollr - just checkout the artifacts in the `Package Packs` action.  

:basecamp: world [repo](https://github.com/Ifiht/Ithavollr)

## Usage
All edits to source material _must_ be done in the `sources` directory. New content may also be added here in the datapaks or resourcepaks folders as applicable. This repo contains two scripts, `dpak_gen.sh` & `rpak_gen.sh` for datapacks and resourcepacks, that work their way through all the sources specified, and overlay them on eachother to create one monolithic data folder and assets folder that 
1. solves the issue of loading order for SpigotMC servers, and
2. allows for precise editing and changing from a known state.

It also allows for easy updating, as soon as a new datapack version comes out, just update the sources folder with the new version, change the name in the script, and re-generate!

## Sources
### Datapacks
 - [True Ending](https://modrinth.com/datapack/true-ending)
 - [Nice Villagers](https://modrinth.com/organization/explorers-eden)
   - Nice Talking Villager
   - Nice Village Names
   - Nice Villager Leashing
   - Nice Villager Names

 - 
### Resourcpacks
 - [BlockPixel](https://modrinth.com/resourcepack/blockpixel)
 - [Fresh Animations](https://modrinth.com/resourcepack/fresh-animations)

## 1.21.4 Upgrade
### Datapacks not updated yet:
### Resourcepacks not updated yet:
 - https://modrinth.com/resourcepack/biome-creepers-fresh
 - https://modrinth.com/resourcepack/icon-xaeros-x-freshanimations
 - https://modrinth.com/resourcepack/fresh-animations-extensions/versions
 - 3d crops???
