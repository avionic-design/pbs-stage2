include packages/desktop/wayland/wayland/Makefile.location
include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--with-host-scanner

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/wayland-scanner \
	$(prefix)/lib/*.so.*
