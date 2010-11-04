PACKAGE = libcanberra
VERSION = 0.26

LOCATION = http://0pointer.de/lennart/projects/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-oss

gtkmod = $(prefix)/lib/gtk-2.0/modules
plugin = $(prefix)/lib/$(PACKAGE)-$(VERSION)

prunefiles = \
	$(gtkmod)/*.la \
	$(plugin)/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/canberra-gtk-play \
	$(gtkmod)/*.so \
	$(plugin)/*.so \
	$(prefix)/lib/*.so.*
