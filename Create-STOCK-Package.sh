#!/bin/bash

if [ -d kernel-repack-MD5/modules/system/etc/init.d ]; then
	echo "Have init.d folder";
else
	echo "Creat init.d folder";
	mkdir -p kernel-repack-MD5/modules/system/etc/init.d
fi

if [ -d kernel-repack-MD5/modules/system/lib/modules ]; then
	rm -Rf kernel-repack-MD5/modules/system/lib/modules/*
	find ./common ./modules -name '*.ko' -exec mv -v {} kernel-repack-MD5/modules/system/lib/modules \;
	mv kernel-repack-MD5/modules/system/lib/modules/bcm4330.ko kernel-repack-MD5/modules/system/lib/modules/dhd.ko
else
	mkdir -p kernel-repack-MD5/modules/system/lib/modules
	find ./common ./modules -name '*.ko' -exec mv -v {} kernel-repack-MD5/modules/system/lib/modules \;
	mv kernel-repack-MD5/modules/system/lib/modules/bcm4330.ko kernel-repack-MD5/modules/system/lib/modules/dhd.ko
fi

mv ./common/arch/arm/boot/zImage ./kernel-repack-MD5/zImage

#if [ -f kernel-repack-MD5/modules/system/lib/modules/j4fs.ko ]; then
#	rm kernel-repack-MD5/ramdisk/lib/modules/j4fs.ko
#	mv kernel-repack-MD5/modules/system/lib/modules/j4fs.ko kernel-repack-MD5/ramdisk/lib/modules/
#fi

#if [ -f kernel-repack-MD5/modules/system/lib/modules/sec_param.ko ]; then
#	rm kernel-repack-MD5/ramdisk/lib/modules/sec_param.ko
#	mv kernel-repack-MD5/modules/system/lib/modules/sec_param.ko kernel-repack-MD5/ramdisk/lib/modules/
#fi

if [ -f ./kernel-repack-MD5/zImage ] && [ "$(find ./kernel-repack-MD5/modules/system/lib/modules/ -name *.ko)" ]; then
	cd kernel-repack-MD5 && ./04-STOCK-package.sh && cd ..
else
	echo 'Error - Compile Fail!'; sleep 5; exit
fi
