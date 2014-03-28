#!/bin/bash

if [ -f ./boot.img ]; then
	echo 'now split boot.img'; sleep 5
else
	echo 'boot.img not exist, now use ori-boot.img'; sleep 5
	cp ori-boot.img boot.img
fi
cd mkbootimg
if [ -f ../boot.img ]; then
	rm ../boot.img-ramdisk.cpio.gz ../boot.img-ramdisk.cpio.lzma ../boot.img-kernel; clear; sleep 5
else
	echo 'cant read file'; sleep 5; exit
fi
perl split_bootimg.pl ../boot.img && rm ../boot.img; sleep 5
mv boot.img-kernel ../
gzip -t -v boot.img-ramdisk.cpio.gz && mv boot.img-ramdisk.cpio.gz ../; clear
lzma -t -v boot.img-ramdisk.cpio.gz && mv boot.img-ramdisk.cpio.gz ../boot.img-ramdisk.cpio.lzma; clear
cd ..
