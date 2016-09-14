#!/usr/bin/env sh

mkdir -p src/

pushd src/

## pantherScore
wget \
    --continue \
    ftp://ftp.pantherdb.org/hmm_scoring/current_release/1.03/pantherScore1.03.zip
unzip pantherScore1.03.zip
rm -r __MACOSX/


## blast-2.2.24
wget \
    --continue \
    ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.24/ncbi-blast-2.2.24+-x64-linux.tar.gz
tar \
    --extract \
    --verbose \
    --file ncbi-blast-2.2.24+-x64-linux.tar.gz
cp ncbi-blast-2.2.24+/bin/* ../bin/
