#!/usr/bin/env bash

cd $(dirname $0)
mkdir -p tmp
cd tmp

if [[ ! -d "rime-frost" ]]; then
    git clone https://github.com/gaboolic/rime-frost.git
    if [[ $? != 0 ]]; then
        echo "failed to clone 'rime-frost'"
        exit 1
    fi
fi
cd "rime-frost"
git pull
if [[ $? != 0 ]]; then
    echo "failed to update 'rime-frost'"
    exit 1
fi

rsync -ahvP --exclude='corrections.dict.yaml' cn_dicts/ ../../dicts/
rsync -ahvP cn_dicts_cell/ ../../dicts/cell/
echo "dictionaries updated from 'rime-frost'"
