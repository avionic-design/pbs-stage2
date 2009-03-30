include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild), $(pbuild-dir)/pbuild, $(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/etc/rcS.d \
	/lib/lsb

files = \
	/etc/group \
	/etc/init.d/mdev \
	/etc/init.d/rcS \
	/etc/passwd \
	/etc/ts.conf \
	/lib/lsb/init-functions

links = \
	/etc/rcS.d/S03mdev \
	/init

include platform/custom.mk

