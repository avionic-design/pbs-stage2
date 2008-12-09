include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild), $(pbuild-dir)/pbuild, $(pbuild-dir)/Makefile)
include scripts/Makefile.lib

dirs = \
	/etc/init.d \
	/usr/share/udhcpc

files = \
	/etc/init.d/rcS

scripts = \
	/usr/share/udhcpc/default.script

links = \
	/init

include platform/custom.mk

