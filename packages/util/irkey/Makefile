PACKAGE = irkey
VERSION = 0.0.1

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
  conf-args += --with-systemdsystemunitdir=/etc/systemd/system
endif

stripfiles = \
	$(prefix)/bin/irkey
