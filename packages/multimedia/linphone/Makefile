PACKAGE = linphone
VERSION = 3.4.3

LOCATION = http://download.savannah.gnu.org/releases/$(PACKAGE)/stable/sources
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
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/linphone \
	$(prefix)/bin/linphone-3 \
	$(prefix)/bin/linphonec \
	$(prefix)/bin/linphonecsh \
	$(prefix)/bin/sipomatic \
	$(prefix)/libexec/mediastream \
	$(prefix)/lib/*.so.*
