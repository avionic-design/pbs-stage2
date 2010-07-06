PACKAGE = exo
VERSION = 0.3.107

LOCATION = http://mocha.xfce.org/archive/src/xfce/$(PACKAGE)/0.3
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--disable-python

conf-vars += \
	ac_cv_strftime_extension=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/exo-csource \
	$(prefix)/bin/exo-desktop-item-edit \
	$(prefix)/bin/exo-mount \
	$(prefix)/bin/exo-open \
	$(prefix)/libexec/exo-helper-0.3 \
	$(prefix)/libexec/exo-mount-notify-0.3 \
	$(prefix)/lib/*.so.*
