#!/usr/bin/env bash

# build coffee/js files
coffee -c -o js/ coffee/emoji.coffee
uglifyjs -c js/emoji.js -o js/emoji.min.js
echo "Coffee/JavaScript built"

# create tmp dir for archive
mkdir emoji
mkdir emoji/emojis
cp js/emoji.min.js emoji/
cp emojis/*.png emoji/emojis/
cp INSTALL emoji/

# create archive
tar czvf emoji.tar.gz emoji/
rm -rf emoji/