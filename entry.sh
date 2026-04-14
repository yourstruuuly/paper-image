#!/bin/sh

set -e

cd $GAMEDIR

# If the paper binary is missing, download it and accept EULA
if [ ! -f "paper.jar" ]; then
    # A download link must be provided otherwise complain
    if [ -z "$PAPER_DOWNLOAD" ]; then
        printf "PAPER_DOWNLOAD variable unset or empty. This must be a direct download link to a paper jar file.\nHead to https://papermc.io/downloads/paper\n"
        exit 1
    fi
    wget "$PAPER_DOWNLOAD" -O "$GAMEDIR/paper.jar"
    java -jar "$GAMEDIR/paper.jar" --nogui
    sed -i "s/false/true/g" "$GAMEDIR/eula.txt"
fi

exec java -jar "$GAMEDIR/paper.jar" --nogui --noconsole
