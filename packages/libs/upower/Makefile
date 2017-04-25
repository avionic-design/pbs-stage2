PACKAGE = upower
VERSION = 0.9.23

LOCATION = http://$(PACKAGE).freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/upower

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/upower \
	$(prefix)/lib/upower/upowerd \
	$(prefix)/lib/*.so.*
