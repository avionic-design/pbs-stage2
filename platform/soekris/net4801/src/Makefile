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
	/etc/ppp \
	/etc/ppp/ip-down.d \
	/etc/ppp/ip-up.d \
	/etc/ppp/peers \
	/etc/rcS.d \
	/lib \
	/lib/lsb \
	/media \
	/root \
	/var \
	/var/log \
	/var/run

files = \
	/etc/dhcpd.conf \
	/etc/fstab \
	/etc/group \
	/etc/hostname \
	/etc/init.d/hostname \
	/etc/init.d/mdev \
	/etc/init.d/modules \
	/etc/init.d/mount \
	/etc/init.d/networking \
	/etc/init.d/rcS \
	/etc/init.d/syslogd \
	/etc/init.d/telnetd \
	/etc/mdev.conf \
	/etc/modules \
	/etc/network/interfaces \
	/etc/passwd \
	/etc/ppp/options \
	/etc/ppp/pap-secrets \
	/etc/ppp/peers/dsl \
	/etc/resolv.conf \
	/lib/lsb/init-functions

scripts = \
	/etc/ppp/ip-up.d/000-usepeerdns \
	/etc/ppp/ip-down.d/000-usepeerdns

links = \
	/etc/rcS.d/S02hostname \
	/etc/rcS.d/S02mount \
	/etc/rcS.d/S03mdev \
	/etc/rcS.d/S09syslogd \
	/etc/rcS.d/S10modules \
	/etc/rcS.d/S20networking \
	/etc/rcS.d/S50telnetd \
	/init

include platform/custom.mk

