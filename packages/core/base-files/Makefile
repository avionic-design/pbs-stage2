PACKAGE = base-files
VERSION = 0.0.0

dirs = \
	/bin \
	/dev \
	/etc \
	/home \
	/lib \
	/lib/lsb \
	/proc \
	/root \
	/sbin \
	/srv \
	/sys \
	/usr \
	/usr/bin \
	/usr/lib \
	/usr/sbin \
	/var \
	/var/log \
	/var/run \

files = \
	/etc/fstab \
	/etc/group \
	/etc/mdev.conf \
	/etc/passwd \
	/etc/sysctl.conf \
	/lib/lsb/init-functions \

# /proc/mounts is always changing and make can't cope with dead links.
# So intead we create the mtab link in the binary script.
#links = \
#	/etc/mtab \

include platforms/common.mk
