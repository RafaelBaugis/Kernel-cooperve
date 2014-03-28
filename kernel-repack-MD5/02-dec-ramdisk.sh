#!/bin/bash

if [ -d ./ramdisk ]; then
	echo 'please dele directory ./ramdisk/'; sleep 5; exit
else
	if [ -f boot.img-ramdisk.cpio.gz ] && [ -f boot.img-ramdisk.cpio.lzma ] && [ -f boot.img-ramdisk.cpio.lzo ]; then
		echo 'Please!!! two ramdisk files are not extracted!!!'
		echo 'hit <Enter> to close!!!'; read; exit
	else
		if [ -f boot.img-ramdisk.cpio.gz ] || [ -f boot.img-ramdisk.cpio.lzma ]; then
			if [ -f boot.img-ramdisk.cpio.lzo ]; then
				mkdir ramdisk && cd ramdisk && lzo -dc ../boot.img-ramdisk.cpio.lzo | cpio -i; strings fsr.ko | grep vermagic; cd ..
				rm boot.img-ramdisk.cpio.lzo
			fi
			if [ -f boot.img-ramdisk.cpio.gz ]; then
				mkdir ramdisk && cd ramdisk && gzip -dc ../boot.img-ramdisk.cpio.gz | cpio -i; strings fsr.ko | grep vermagic; cd ..
				rm boot.img-ramdisk.cpio.gz
			fi
			if [ -f boot.img-ramdisk.cpio.lzma ]; then
				mkdir ramdisk && cd ramdisk && lzma -dc ../boot.img-ramdisk.cpio.lzma | cpio -i; strings fsr.ko | grep vermagic; cd ..
				rm boot.img-ramdisk.cpio.lzma
			fi
		else
			./01-split-boot.img.sh && sleep 5
			if [ -f boot.img-ramdisk.cpio.lzo ]; then
				mkdir ramdisk && cd ramdisk && lzo -dc ../boot.img-ramdisk.cpio.lzo | cpio -i; strings fsr.ko | grep vermagic; cd ..
				rm boot.img-ramdisk.cpio.lzo
			fi
			if [ -f boot.img-ramdisk.cpio.gz ]; then
				mkdir ramdisk && cd ramdisk && gzip -dc ../boot.img-ramdisk.cpio.gz | cpio -i; strings fsr.ko | grep vermagic; cd ..
				rm boot.img-ramdisk.cpio.gz
			fi
			if [ -f boot.img-ramdisk.cpio.lzma ]; then
				mkdir ramdisk && cd ramdisk && lzma -dc ../boot.img-ramdisk.cpio.lzma | cpio -i; strings fsr.ko | grep vermagic; cd ..
				rm boot.img-ramdisk.cpio.lzma
			fi
		fi
	fi
fi
sleep 5
