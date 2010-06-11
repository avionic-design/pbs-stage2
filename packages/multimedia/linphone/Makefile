PACKAGE = linphone
VERSION = 3.2.1

LOCATION = http://www.very-clever.com/download/nongnu/$(PACKAGE)/3.2.x/sources
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-video \
	--disable-rpath

ifeq ($(CONFIG_PACKAGE_MULTIMEDIA_LINPHONE_GTK),y)
  conf-args += --enable-gtk_ui=yes
else
  conf-args += --enable-gtk_ui=no
endif

prunefiles = \
	$(prefix)/lib/liblinphone.la \
	$(prefix)/lib/libmediastreamer.la \
	$(prefix)/lib/libortp.la

stripfiles = \
	$(prefix)/bin/linphone-3 \
	$(prefix)/bin/linphonec \
	$(prefix)/bin/linphonecsh \
	$(prefix)/bin/sipomatic \
	$(prefix)/libexec/mediastream \
	$(prefix)/lib/liblinphone.so.3.2.1 \
	$(prefix)/lib/libmediastreamer.so.0.0.0 \
	$(prefix)/lib/libortp.so.8.0.0
