include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild), $(pbuild-dir)/pbuild, $(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/etc/network \
	/etc/network/if-down.d \
	/etc/network/if-post-down.d \
	/etc/network/if-pre-up.d \
	/etc/network/if-up.d \
	/etc/rcS.d \
	/lib \
	/lib/lsb \
	/media \
	/media/sd-card \
	/media/usb-storage \
	/root \
	/usr/share/udhcpc \
	/var \
	/var/run

files = \
	/etc/fstab \
	/etc/group \
	/etc/hostname \
	/etc/init.d/hostname \
	/etc/init.d/mdev \
	/etc/init.d/modules \
	/etc/init.d/mount \
	/etc/init.d/networking \
	/etc/init.d/rcS \
	/etc/init.d/telnetd \
	/etc/mdev.conf \
	/etc/modules \
	/etc/passwd \
	/etc/network/interfaces \
	/lib/lsb/init-functions \
	/root/igmp-snooping.sh \
	/root/perf-test.sh \
	/root/vlan-port-based.sh \
	/root/vlan-tag-based.sh

scripts = \
	/usr/share/udhcpc/default.script

links = \
	/etc/rcS.d/S02hostname \
	/etc/rcS.d/S02mount \
	/etc/rcS.d/S03mdev \
	/etc/rcS.d/S10modules \
	/etc/rcS.d/S20networking \
	/etc/rcS.d/S50telnetd \
	/init

include platform/custom.mk

