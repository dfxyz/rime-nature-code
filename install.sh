#!/usr/bin/env bash

[[ $OS == "Windows_NT" ]] && onWindows=true || onWindows=false

if $onWindows; then
    rimeDir=$APPDATA/Rime
else
    rimeDir=~/.local/share/fcitx5/rime
fi

mkdir -p $rimeDir

[[ -e $rimeDir/dicts ]] && rm -rf $rimeDir/dicts
ln -s $PWD/dicts $rimeDir
[[ -e $rimeDir/lua ]] && rm -rf $rimeDir/lua
ln -s $PWD/lua $rimeDir
ln -sf $PWD/*.yaml $rimeDir

if ! $onWindows; then
    mkdir -p ~/.local/share/fcitx5/themes/CandyPaper
    ln -sf $PWD/themes/fcitx5.conf ~/.local/share/fcitx5/themes/CandyPaper/theme.conf
fi
