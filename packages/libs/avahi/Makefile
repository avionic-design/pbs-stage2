PACKAGE = avahi
VERSION = 0.6.31
LICENSE = LGPL

LOCATION = http://avahi.org/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-distro=none \
	--disable-manpages \
	--disable-python \
	--disable-mono \
	--disable-gdbm \
	--disable-gtk3 \
	--disable-gtk \
	--disable-qt4 \
	--disable-qt3

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
  conf-args += --with-systemdsystemunitdir=/etc/systemd/system
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/avahi-browse \
	$(prefix)/bin/avahi-publish \
	$(prefix)/bin/avahi-resolve \
	$(prefix)/bin/avahi-set-host-name \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/avahi-autoipd \
	$(prefix)/sbin/avahi-daemon \
	$(prefix)/sbin/avahi-dnsconfd
