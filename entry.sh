#!/bin/sh

set -e

cd $GAMEDIR

if [ ! -f "paper.jar" ]; then
    wget $DLURL -O "$GAMEDIR/paper.jar"
    java -jar "$GAMEDIR/paper.jar" --nogui
    sed -i "s/false/true/g" "$GAMEDIR/eula.txt"
fi

exec java -jar "$GAMEDIR/paper.jar" --nogui --noconsole \
    --host "$PAPER_HOST" \
    --port "$PAPER_PORT"
