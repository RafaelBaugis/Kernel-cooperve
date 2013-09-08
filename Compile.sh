#!/bin/bash

export CROSS_COMPILE=~/arm-2009q3/bin/arm-none-eabi-
export CC="$CROSS_COMPILE"gcc
export CXX="$CROSS_COMPILE"g++
export ARCH=arm
echo "Listing cross compiler"; sleep 1
ls -l $CROSS_COMPILE*
echo "hit <Enter> to continue or <Ctrl + C> to cancel." && sleep 1 && read

cd common

make distclean && make bcm21553_cooperve_defconfig

echo "Ready to compile? Hit <Enter> to Continue or <Ctrl>+<C> to Cancel!";
sleep 1 && read
make -j`grep processor /proc/cpuinfo | wc -l`
