PACKAGE = freerdp
VERSION = 0.8.1

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-printer=no

plugin = $(prefix)/lib/$(PACKAGE)

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/xfreerdp \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
