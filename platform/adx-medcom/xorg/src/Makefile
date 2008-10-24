include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild), $(pbuild-dir)/pbuild, $(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/dev \
	/etc/init.d \
	/lib/lsb \
	/media/sd-card \
	/proc \
	/sys \
	/tmp \
	/var/lock \
	/var/log

files = \
	/etc/group \
	/etc/init.d/rcS \
	/etc/passwd \
	/lib/lsb/init-functions

include platform/custom.mk

