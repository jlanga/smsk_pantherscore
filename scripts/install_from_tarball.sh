#!/usr/bin/env sh

mkdir -p src/

pushd src/

## pantherScore
wget \
    --continue \
    ftp://ftp.pantherdb.org/hmm_scoring/current_release/1.03/pantherScore1.03.zip
unzip pantherScore1.03.zip
rm -r __MACOSX/
