Ace-I-Kernel
============

Kernel for Galaxy Ace-i based on Rafael.Baugis (bieltv3 actually) kernel sources.

Features:
- Kernel Samepage Merging (KSM)
- Busybox 1.21.1 (installed in /sbin - for recovery).
- EXT4FS Cleancache support.
- PROCFS autogroup scheduling support.
- Reworked ramdisk.
- Auto install su at boot (Version "1.86:SUPERSU")

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
- Bieltv3 for his source.
- and me :)

Compiling:
============
1. Download Sourcery from "http://www.mentor.com/embedded-software/sourcery-tools/sourcery-codebench/editions/lite-edition/" (ARM/EABI release).
2. Unpack it to home directory (~/)
3. Clone this github.
4. It seems logical.
5. At the end files will be in ~/Ace-I-Kernel/* (tar for Odin, zip for CWM).
============
Done!
