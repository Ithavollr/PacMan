#!/bin/env bash
# This script is to be deployed in the world/datapacks/itv_dpak directory,
# and run every time this repository updates any datapack.

echo "))}> Cloning Repo..."
git clone --depth 1 https://github.com/Ifiht/PacMan.git
echo "))}> Deleting old data..."
rm -rf data
echo "))}> Moving new data..."
mv PacMan/data_v61/data ./
mv PacMan/data_v61/pack.mcmeta ./
echo "))}> Deleting Repo..."
rm -rf PacMan
echo "))}> All done!"
