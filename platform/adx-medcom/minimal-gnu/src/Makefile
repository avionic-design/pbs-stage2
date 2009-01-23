include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild),$(pbuild-dir)/pbuild,$(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/etc/rcS.d \
	/lib/lsb \
	/var/lock \
	/var/log

files = \
	/etc/group \
	/etc/init.d/rcS \
	/etc/init.d/syslogd \
	/etc/passwd \
	/lib/lsb/init-functions

links = \
	/etc/rcS.d/S10syslogd \
	/init

include platform/custom.mk

