include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild),$(pbuild-dir)/pbuild,$(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/lib/lsb \
	/scripts \
	/tmp \
	/var/lock \
	/var/log

files = \
	/init \
	/lib/lsb/init-functions

include platform/custom.mk

