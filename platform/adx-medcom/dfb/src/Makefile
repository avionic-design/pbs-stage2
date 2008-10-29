include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild), $(pbuild-dir)/pbuild, $(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/lib/lsb

files = \
	/etc/group \
	/etc/init.d/rcS \
	/etc/passwd \
	/lib/lsb/init-functions

include platform/custom.mk

