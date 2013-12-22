#!/bin/bash

rm k-ok r-ok

if [ -f zImage ] && [ -f boot.img-kernel ]; then
	rm boot.img-kernel; mv zImage boot.img-kernel; clear
	test boot.img-kernel && touch k-ok
else
	mv zImage boot.img-kernel; clear
	test boot.img-kernel && touch k-ok
fi

if [ -f boot.img-ramdisk.cpio.gz ] || [ -f boot.img-ramdisk.cpio.lzma ] || [ -f boot.img-ramdisk.cpio.lzo ]; then
	if [ -f boot.img-ramdisk.cpio.gz ] && [ -f boot.img-ramdisk.cpio.lzma ] && [ -f boot.img-ramdisk.cpio.lzo ]; then
		echo "TWO RAMDISK NOT SOPPORTED!";
		sleep 5; exit
	fi
	test boot.img-ramdisk.cpio.gz && echo "RAMDISK in cpio.gz	- Good!"; touch r-ok
	test boot.img-ramdisk.cpio.lzo && echo "RAMDISK in cpio.lzo	- Good!"; touch r-ok
	test boot.img-ramdisk.cpio.lzma && echo "RAMDISK in cpio.lzma	- Good!"; touch r-ok
else
	rm -Rf ramdisk
	ln -s ramdisk_CM7 ramdisk
	if [ -d ramdisk ]; then
		echo "CREATING RAMDISK";
		./03-compress-ramdisk.lzma.sh
		test boot.img-ramdisk.cpio.lzma && echo "RAMDISK	- OK"; touch r-ok
	else
		echo "Wont rave ramdisk files and folder!";
		sleep 5; exit
	fi
fi

if [ -f k-ok ] && [ -f r-ok ]; then
	rm k-ok r-ok
	echo "Kernel and RAMDISK - OK";
else
	rm k-ok r-ok
	echo "Kernel or RAMDISK - Faill"; sleep 5; exit
fi

cd mkbootimg

if [ -f ../boot.img-ramdisk.cpio.gz ] && [ -f ../boot.img-kernel ]; then
	md5sum ../boot.img-kernel > md5
	echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
	dd if=md5 of=run.sh bs=1 seek=52 count=32
	echo ' --ramdisk ../boot.img-ramdisk.cpio.gz --base 0x81600000 -o ../boot.img' >> run.sh
fi

if [ -f ../boot.img-ramdisk.cpio.lzo ] && [ -f ../boot.img-kernel ]; then
	md5sum ../boot.img-kernel > md5
	echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
	dd if=md5 of=run.sh bs=1 seek=52 count=32
	echo ' --ramdisk ../boot.img-ramdisk.cpio.lzo --base 0x81600000 -o ../boot.img' >> run.sh
fi

if [ -f ../boot.img-ramdisk.cpio.lzma ] && [ -f ../boot.img-kernel ]; then
	md5sum ../boot.img-kernel > md5
	echo './mkbootimg --kernel ../boot.img-kernel --kernelMD5 ' > run.sh
	dd if=md5 of=run.sh bs=1 seek=52 count=32
	echo ' --ramdisk ../boot.img-ramdisk.cpio.lzma --base 0x81600000 -o ../boot.img' >> run.sh
fi

if [ -f run.sh ] && [ -f md5 ]; then
	rm ../kernel/boot.img ../boot.img ../*-boot.img.tar ../*-modules.zip ../*-boot.img.zip; clear; sleep 5
	chmod +x run.sh mkbootimg && ./run.sh && rm run.sh md5
	cd ..
	tar -cvf CM7-PDA-boot.img.tar boot.img && mv boot.img kernel/ && cd kernel && zip -r ../CM7-boot.img.zip . ;
	cd ..
	mv CM7-boot.img.zip ../$(cat ../common/.version)-CM7-boot.img.zip && echo "$(cat ../common/.version)-CM7-boot.img.zip <-> READY"
	mv CM7-PDA-boot.img.tar ../$(cat ../common/.version)-CM7-PDA-boot.img.tar && echo "$(cat ../common/.version)-CM7-PDA-boot.img.tar <-> READY"
else
	echo "boot.img creation - Faill"; sleep 5; exit
fi

echo "CM7 DONE";

sleep 5
