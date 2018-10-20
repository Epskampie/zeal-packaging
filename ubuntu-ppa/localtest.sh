#!/bin/bash

DISTR="xenial"
ZEAL_VER="0.6.1"

function failure {
    echo -e "\033[1mERROR:\033[0m \E[31m$1\033[0m"
    exit 1
}

rm -rf "zeal-$ZEAL_VER"
rm zeal_*

SRC_TARBALL="zeal_$ZEAL_VER.orig.tar.gz"
SRC_DIR="zeal-$ZEAL_VER"

if [ ! -f "$SRC_TARBALL" ]; then
    curl -L -o "$SRC_TARBALL" https://github.com/zealdocs/zeal/archive/v$ZEAL_VER.tar.gz
    [ ! -f "$SRC_TARBALL" ] && failure "Cannot download tarball"
fi

tar xzf "$SRC_TARBALL"

cp -r debian "$SRC_DIR"
sed -i -- "s/#DISTR#/$DISTR/g" "$SRC_DIR"/debian/changelog

cd "$SRC_DIR"
    dpkg-buildpackage --build=source
cd ..

sudo pbuilder build --distribution $DISTR --architecture amd64 --basetgz /var/cache/pbuilder/${DISTR}-amd64-base.tgz zeal_0.6.1-3ppa1~xenial1.dsc
