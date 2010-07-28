PACKAGE = freerdp
VERSION = 0.7.3

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-printer=no

plugin = $(prefix)/lib/$(PACKAGE)

stripfiles = \
	$(prefix)/bin/xfreerdp \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
