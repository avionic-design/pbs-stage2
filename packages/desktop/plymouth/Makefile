PACKAGE = plymouth
VERSION = 0.8.3

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-system-root-install \
	--disable-gdm-transition \
	--enable-tracing \
	--disable-tests \
	--disable-pango \
	--disable-gtk

plugin = $(prefix)/lib/$(PACKAGE)

prunefiles = \
	$(prefix)/lib/*.la \
	$(plugin)/*.a \
	$(plugin)/*.la \
	$(plugin)/renderers/*.a \
	$(plugin)/renderers/*.la

stripfiles = \
	$(prefix)/bin/plymouth \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so \
	$(plugin)/renderers/*.so \
	$(prefix)/sbin/plymouthd
