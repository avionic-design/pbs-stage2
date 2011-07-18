PACKAGE = medatom-utils
VERSION = 0.3.0

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/$(PACKAGE)
