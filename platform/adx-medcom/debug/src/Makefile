include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild),$(pbuild-dir)/pbuild,$(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/etc/modprobe.d \
	/lib/lsb \
	/media/sd-card \
	/tmp \
	/usr/share/udhcpc \
	/var/lock \
	/var/log

files = \
	/etc/fstab \
	/etc/group \
	/etc/init.d/rcS \
	/etc/init.d/syslogd \
	/etc/passwd \
	/etc/sysctl.conf \
	/lib/lsb/init-functions

links = \
	/etc/rcS.d/S10syslogd

progs = \
	/usr/bin/igmp-join

scripts = \
	/usr/share/udhcpc/default.script

stripfiles = $(progs)

include platform/custom.mk

