PACKAGE = libXpm
VERSION = 3.5.11

include packages/xorg/lib/common.mk

conf-args += \
	--with-sysroot=$(SYSROOT)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/cxpm \
	$(prefix)/bin/sxpm \
	$(prefix)/lib/*.so.*
