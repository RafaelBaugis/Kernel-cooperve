#!/sbin/sh

if /sbin/busybox test ! -f /etc/fstab; then
	/sbin/busybox cat /res/fstab > /etc/fstab
else
	/sbin/busybox cat /etc/fstab | /sbin/busybox grep rfs && /sbin/busybox cat /res/fstab > /etc/fstab
fi

if /sbin/busybox test ! -f /etc/mtab; then
	/sbin/busybox cat /res/mtab > /etc/mtab
else
	/sbin/busybox cat /etc/mtab | /sbin/busybox grep rfs && /sbin/busybox cat /res/mtab > /etc/mtab
fi

bbdir="/system/bin /system/sbin" ; 
ndeletes=0 ; 
for bbpath in $bbdir ; 
	do 
		for f in $(busybox find $bbpath -type l) ; 
			do 
				gnr=$(busybox readlink $f) ; 
				if echo "$gnr" |busybox grep -q busybox ; 
					then 
						busybox echo "$f linking to $gnr . Now deleting" ; 
						busybox rm $f ; 
						ndeletes=`busybox expr $ndeletes + 1` ; 
					else busybox echo "$f is not linked to busybox, but to $gnr ---> file not deleted" ; 
				fi ; 
		done 
done

if /sbin/busybox test -f /system/bin/busybox; then
	/sbin/busybox rm -Rf /system/bin/busybox
fi

if /sbin/busybox test ! -d /system/sbin; then
	/sbin/busybox mkdir /system/sbin
fi

if /sbin/busybox test ! -h /system/sbin/busybox ; then
	/sbin/busybox rm -Rf /system/sbin/busybox
	/sbin/busybox ln -s /system/xbin/busybox /system/sbin/busybox
fi

if /sbin/busybox test ! -d /system/xbin; then
	/sbin/busybox mkdir -p /system/xbin
fi

if /sbin/busybox test ! -f /system/xbin/busybox; then
	/sbin/busybox cp /sbin/busybox /system/xbin/busybox
	/sbin/busybox chown 0.0 /system/xbin/busybox
	/sbin/busybox chmod 4755 /system/xbin/busybox
	/system/xbin/busybox --install -s /system/xbin
else
	/sbin/busybox chown 0.0 /system/xbin/busybox
	/sbin/busybox chmod 4755 /system/xbin/busybox
	/system/xbin/busybox --install -s /system/xbin
fi

if /sbin/busybox test -h /system/xbin/su; then
	/sbin/busybox rm -Rf /system/xbin/su
fi

if /sbin/busybox test -f /system/sbin/su; then
	/sbin/busybox rm -Rf /system/sbin/su
fi

if /sbin/busybox test -f /system/bin/su; then
	/sbin/busybox rm -Rf /system/bin/su
fi

if /sbin/busybox test ! -f /system/xbin/su; then
	/sbin/busybox cp /sbin/su-bin /system/xbin/su
	/sbin/busybox chown 0.0 /system/xbin/su
	/sbin/busybox chmod 6755 /system/xbin/su
else
	/sbin/busybox chown 0.0 /system/xbin/su
	/sbin/busybox chmod 6755 /system/xbin/su
fi
