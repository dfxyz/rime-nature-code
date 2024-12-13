#!/usr/bin/env bash

if [[ $OS == "Windows_NT" ]]; then
    targetDir=$APPDATA/Rime
else
    targetDir=~/.local/share/fcitx5/rime
fi

[[ -e $targetDir/dicts ]] && rm -rf $targetDir/dicts
[[ -e $targetDir/lua ]] && rm -rf $targetDir/lua

ln -s $PWD/dicts $targetDir
ln -s $PWD/lua $targetDir
ln -sf $PWD/*.yaml $targetDir
