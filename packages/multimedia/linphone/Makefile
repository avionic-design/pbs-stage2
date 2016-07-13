PACKAGE = linphone
VERSION = 3.9.1
LICENSE = GPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://download-mirror.savannah.gnu.org/releases/$(PACKAGE)/$(MAJOR).$(MINOR).x/sources
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--disable-video \
	--disable-rpath \
	--enable-external-mediastreamer \
	--enable-external-ortp \
	--disable-tests \
	--disable-tutorials

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_LINPHONE_GTK),y)
  conf-args += \
	--enable-gtk_ui=yes \
	--enable-strict=no
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
	$(prefix)/bin/linphonec \
	$(prefix)/bin/linphonecsh \
	$(prefix)/bin/lp-autoanswer \
	$(prefix)/lib/*.so.*
