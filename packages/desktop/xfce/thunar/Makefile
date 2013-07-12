PACKAGE = Thunar
VERSION = 1.4.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

plugin = $(prefix)/lib/thunarx-2

prunefiles = \
	$(prefix)/lib/xfce4/panel/plugins/*.la \
	$(prefix)/lib/*.la \
	$(plugin)/*.la

stripfiles = \
	$(prefix)/bin/Thunar \
	$(prefix)/lib/Thunar/thunar-sendto-email \
	$(prefix)/lib/xfce4/panel/plugins/*.so \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so
