#!/bin/bash
cd common && make mrproper && touch ../clear
cd ..
if [ -f clear ]; then
	rm clear
	rm -Rf kernel-repack-MD5/*.lzma kernel-repack-MD5/*.gz kernel-repack-MD5/boot.img-kernel
	rm -Rf kernel-repack-MD5/CWM_kernel/boot.img
	rm -Rf kernel-repack-MD5/CWM_kernel/system/lib/modules/*
	rm *.zip *.tar
	find ./common ./modules -name '.gitignore' -exec rm -Rf -v {} \;
	find ./common ./modules ! -uid '1000' -exec chown 1000.1000 -v {} \;
	find ./common ./modules ! -perm '0755' -exec chmod 0755 -v {} \;
	git add .
	git commit -a && touch commit
fi

if [ -f commit ]; then
	git push -u origin master && rm commit
fi
echo 'hit <Enter> to close!!!'; read