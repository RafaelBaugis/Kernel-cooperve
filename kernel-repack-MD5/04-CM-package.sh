#!/bin/bash
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-CM-package-CM7.sh
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.imgramdisk.cpio.*
./04-MODULES-package.sh
echo "CM7 package DONE!";-

sleep 5
