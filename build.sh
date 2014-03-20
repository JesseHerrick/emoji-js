#!/usr/bin/env bash

# build coffee/js files
coffee -c -o js/ coffee/emoji.coffee
uglifyjs -c js/emoji.js -o js/emoji.min.js
echo "\e[0;33;49mCoffee/JavaScript built\e[0m"

# create tmp dir for archive
mkdir emoji
mkdir emoji/emojis
cp js/emoji.min.js emoji/
cp emojis/*.png emoji/emojis/
cp INSTALL emoji/

# create archive
tar czvf emoji.tar.gz emoji/
rm -rf emoji/
echo "\e[0;33;49mArchive created\e[0m"
echo "\e[0;32;49mDone!\e[0m"