#!/usr/bin/bash

set -xe

function proton-run(execpath, runnerpath, compdatapath)
{
  STEAM_COMPAT_DATA_PATH=$compdatapath
  STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.steam/steam
  WINEPREFIX="$compatdatapath/pfx/"
  PROTON_USE_WINED3D=1
  $runnerpath $exepath
}

function wine-run(exepath, runnerpath, prefix)
{
  WINEPREFIX=$prefix
  $runnerpath $execpath
}

vortex=$HOME/
game=$1

runnerpath="$HOME/.steam/steam/steamapps/common/Proton - Experimental/proton run"
execpath="$HOME/wine-prefixes/games/default/drive_c/"


# matches integers
case $game in
     "skyrim/i")


esac
