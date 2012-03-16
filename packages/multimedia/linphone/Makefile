PACKAGE = linphone
VERSION = 3.5.2
LICENSE = GPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://download-mirror.savannah.gnu.org/releases/$(PACKAGE)/$(MAJOR).$(MINOR).x/sources
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

m4-dirs = \
	$(pkgbuildtree)/mediastreamer2/m4 \
	$(pkgbuildtree)/oRTP/m4

$(m4-dirs):
	$(call cmd,mkdir_p)

$(pkgtree)/.autoreconfigure: | $(m4-dirs)

conf-args += \
	--disable-video \
	--disable-rpath

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_LINPHONE_GTK),y)
  conf-args += --enable-gtk_ui=yes
else
  conf-args += --enable-gtk_ui=no
endif

ifneq ($(CONFIG_PACKAGE_MULTIMEDIA_LINPHONE_SPEEX),y)
  conf-args += --disable-speex
else
  conf-args += --enable-speex
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/linphone \
	$(prefix)/bin/linphone-3 \
	$(prefix)/bin/linphonec \
	$(prefix)/bin/linphonecsh \
	$(prefix)/bin/mediastream \
	$(prefix)/bin/sipomatic \
	$(prefix)/libexec/mediastream \
	$(prefix)/lib/*.so.*
