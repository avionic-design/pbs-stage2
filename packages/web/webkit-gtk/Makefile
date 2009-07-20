PACKAGE = webkit
VERSION = 1.1.10

LOCATION = http://www.webkitgtk.org
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-unicode-backend=icu \
	--disable-video

conf-vars += \
	ac_cv_path_icu_config='$(ROOTFS)$(prefix)/bin/icu-config' \
	ac_cv_path_PKG_CONFIG=$(TARGET)-pkg-config

prunefiles = \
	$(prefix)/lib/libwebkit-1.0.la

stripfiles = \
	$(prefix)/bin/jsc \
	$(prefix)/lib/libwebkit-1.0.so.2.7.0
