PACKAGE = libXdmcp
VERSION = 1.1.2

include packages/xorg/lib/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
