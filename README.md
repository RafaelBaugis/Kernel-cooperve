Ace-I-Kernel
============

Kernel for Galaxy Ace-i based on Rafael.Baugis (bieltv3 actually) kernel sources.

Features:
- EXT4 boot (no RFS).
- Kernel Samepage Merging (KSM)
- Busybox 1.21.1 (installed in /sbin - for recovery).
- EXT4FS Cleancache support.
- PROCFS autogroup scheduling support.
- Reworked ramdisk.
- Auto install su at boot (Version "1.86:SUPERSU").
- Auto install busybox at boot (Version "1.21.1").
- Swap.
- zRAM.
- Ramzswap.
- IPTables full needed rules.
- Init.d

Bugs:
- SIM contacts reading (as everywhere).
- Adobe Flash Player (Working: "https://www.mediafire.com/?7fkbal3s0bszdb9")

Editions (only difference is ramdisk [look kernel-repack-MD5]):
- OLD - Old ramdisk stands as backup. Some features not present or OLD.
- NEW - New ramdisk totally reworked. There are all changes (mainstream).
- CM7 - New ramdisk with CM7 support (BETA [still problems ie. Bluetooth]).

Frequencies:
- 832 (1.32V)
- 748 (1.30V)
- 624 (1.28V)
- 534 (1.26V)
- 468 (1.24V)
- 312 (1.22V)
- 208 (1.20V)

Governors:
- performance
- smartassV2
- smartassH3
- Lionheart (default)
- powersave
- ondemand
- ondemandX
- interactive
- interactiveX
- brazilianwax
- and... of course bcm21553 epic governor!

I/O schedulers:
- noop
- deadline
- cfq
- vr (default)
- sio
- bfq

Credits:
- Rafael.Baugis for base kernel.
- Bieltv3/Astinj (bieltv3 dropped source for Astinj?) for his source.
- and me :)

Compiling:
============
1. Download Sourcery from "http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/"
(ARM Processors/EABI Release).
2. Unpack it to home directory (~/)
3. Clone this github.
4. It seems logical.
5. At the end files will be in ~/Ace-I-Kernel/* (tar for Odin, zip for CWM).
6. Done!
