PACKAGE = exo
VERSION = 0.5.4

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
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
