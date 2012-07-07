#!/bin/bash

if [ -d ./ramdisk ]; then
	echo 'please dele directory ./ramdisk/'; sleep 5; exit
else
	if [ -f boot.img-ramdisk.cpio.gz ] && [ -f boot.img-ramdisk.cpio.lzma ]; then
		echo 'Please!!! two ramdisk files are not extracted!!!'
		echo 'hit <Enter> to close!!!'; read; exit
	else
		if [ -f boot.img-ramdisk.cpio.gz ] || [ -f boot.img-ramdisk.cpio.gz ]; then
			if [ -f boot.img-ramdisk.cpio.gz ]; then
				mkdir ramdisk; && cd ramdisk; && gzip -dc ../boot.img-ramdisk.cpio.gz | cpio -i; strings fsr.ko | grep vermagic; cd ..
				gzip -d boot.img-ramdisk.cpio.gz
			fi
			if [ -f boot.img-ramdisk.cpio.lzma ]; then
				mkdir ramdisk; && cd ramdisk; && lzma -dc ../boot.img-ramdisk.cpio.lzma | cpio -i; strings fsr.ko | grep vermagic; cd ..
				lzma -d boot.img-ramdisk.cpio.lzma
			fi
		else
			./01-split-boot.img.sh && sleep 5 
			if [ -f boot.img-ramdisk.cpio.gz ]; then
				mkdir ramdisk; && cd ramdisk; && gzip -dc ../boot.img-ramdisk.cpio.gz | cpio -i; strings fsr.ko | grep vermagic; cd ..
				gzip -d boot.img-ramdisk.cpio.gz
			fi
			if [ -f boot.img-ramdisk.cpio.lzma ]; then
				mkdir ramdisk; && cd ramdisk; && lzma -dc ../boot.img-ramdisk.cpio.lzma | cpio -i; strings fsr.ko | grep vermagic; cd ..
				lzma -d boot.img-ramdisk.cpio.lzma
			fi
		fi
	fi
fi
sleep 5
