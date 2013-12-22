#!/bin/bash
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-creat-package-OLD.sh
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-creat-package-NEW.sh
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-creat-package-CM7.sh
rm -Rf kernel/boot.img
rm -Rf ramdisk
rm -Rf boot.img-ramdisk.cpio.*
./04-creat-package-MODULES.sh
echo "ALL DONE";

sleep 5
