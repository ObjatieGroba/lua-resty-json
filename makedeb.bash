#!/usr/bin/env bash

rm -f lua-resty-json_*.deb
rm -R deb/usr/

mkdir -p deb/usr/lib/x86_64-linux-gnu/lua/5.1/
mkdir -p deb/usr/share/lua/5.1/

rm -R deb/usr/lib/x86_64-linux-gnu/lua/5.1/*
rm -R deb/usr/share/lua/5.1/*

make

cp libljson.so deb/usr/lib/x86_64-linux-gnu/lua/5.1/libljson.so
cp json_decoder.lua deb/usr/share/lua/5.1/json_decoder.lua

cd deb
dpkg-buildpackage  -us -uc -b
cd -

rm -R deb/usr/
rm -R deb/debian/lua-resty-json
