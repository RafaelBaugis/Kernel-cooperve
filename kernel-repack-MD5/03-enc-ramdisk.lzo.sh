#!/bin/bash

chmod -R 750 ramdisk/*
	chmod 755 ramdisk/sbin
	chmod 750 ramdisk/sbin/*
	chmod 4755 ramdisk/sbin/sqlite3
	chmod 6755 ramdisk/sbin/su-bin

	chmod 755 ramdisk/lib
		chmod 755 ramdisk/lib/modules
		chmod 744 ramdisk/lib/modules/*
	
	chmod 755 ramdisk/res
	chmod 644 ramdisk/res/*
		chmod 755 ramdisk/res/images
		chmod 644 ramdisk/res/images/*
			chmod 755 ramdisk/res/images/240x320
			chmod 644 ramdisk/res/images/240x320/*
	
mkdir -p -m 755 ramdisk/data
mkdir -p -m 755 ramdisk/dev
mkdir -p -m 755 ramdisk/proc
mkdir -p -m 755 ramdisk/sys
mkdir -p -m 755 ramdisk/system
mkdir -p -m 755 ramdisk/tmp

chmod 755 ramdisk/data
chmod 755 ramdisk/dev
chmod 755 ramdisk/proc
chmod 755 ramdisk/sys
chmod 755 ramdisk/system
chmod 755 ramdisk/tmp

cd ./ramdisk/ && rm ../boot.img-ramdisk.cpio.lzo; clear; sleep 5; find . | cpio -o -H newc | lzop > ../boot.img-ramdisk.cpio.lzo
