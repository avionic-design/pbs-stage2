PACKAGE = dbus-watchdog
VERSION = 0.1.2

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
  conf-args += --with-systemdsystemunitdir=/etc/systemd/system
endif

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/dbus-watchdogd
