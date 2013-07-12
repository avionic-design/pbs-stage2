PACKAGE = exo
VERSION = 0.8.0

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.xfce.org/xfce/4.10/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-gio-unix \
	--disable-python

conf-vars += \
	ac_cv_strftime_extension=yes

prunefiles = \
	$(prefix)/lib/gio/modules/*.la \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/exo-csource \
	$(prefix)/bin/exo-desktop-item-edit \
	$(prefix)/bin/exo-mount \
	$(prefix)/bin/exo-open \
	$(prefix)/libexec/exo-helper-$(MAJOR).$(MINOR) \
	$(prefix)/libexec/exo-mount-notify-$(MAJOR).$(MINOR) \
	$(prefix)/lib/xfce4/exo-1/exo-helper-1 \
	$(prefix)/lib/gio/modules/*.so \
	$(prefix)/lib/*.so.*
