include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild),$(pbuild-dir)/pbuild,$(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/lib/lsb \
	/root \
	/var/lock \
	/var/log

files = \
	/etc/group \
	/etc/init.d/rcS \
	/etc/passwd \
	/lib/lsb/init-functions

scripts =

progs = \
	/root/i2c-card-dump

links = \
	/init

include platform/custom.mk

