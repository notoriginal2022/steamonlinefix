#!/bin/bash

set -e

BIN="gamebinary.exe"
WINEPREFIX="$HOME/steamwine"
STEAM="$HOME/.local/share/Steam"
PROTON="$STEAM/steamapps/common/Proton 9.0 (Beta)/proton"
RUNTIME="$STEAM/steamapps/common/SteamLinuxRuntime_sniper/run"

mkdir -p "$WINEPREFIX"

if [ ! -f $BIN ]; then
    echo "binary don't exists"
    exit
fi

export WINEPREFIX
export STEAM_COMPAT_DATA_PATH="$WINEPREFIX"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$STEAM"
export STEAM_COMPAT_INSTALL_PATH="$(dirname "$BIN")"
export STEAM_COMPAT_APP_ID=480
export SteamAppId=480
export SteamGameId=480

exec "$RUNTIME" -- "$PROTON" waitforexitandrun "$BIN"
