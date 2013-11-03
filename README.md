Ace-I-Kernel
============

Kernel for Galaxy Ace-i based on Rafael.Baugis (bieltv3 actually) kernel sources.

Features:
- Kernel Samepage Merging (KSM)
- Busybox 1.21.1 (installed in /sbin - for recovery).

Frequencies:
- 832 (1.32V)
- 748 (1.30V)
- 624 (1.28V)
- 532 (1.26V)
- 468 (1.24V)
- 312 (1.22V)
- 208 (1.20V)

Governors:
- performance
- smartassV2
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
- Bieltv3 for giving source.
- and me :)
