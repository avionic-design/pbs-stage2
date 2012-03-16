PACKAGE = proxyconf
VERSION = 0.1.0

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += --with-sysroot=$(SYSROOT)

plugin = $(prefix)/lib/gio/modules

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.a \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/proxyconf-query \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
