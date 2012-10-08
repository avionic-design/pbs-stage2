PACKAGE = syslog-ng
VERSION = 3.3.5
LICENSE = LGPL/GPL

LOCATION = http://www.balabit.com/downloads/files/$(PACKAGE)/open-source-edition/$(VERSION)/source
TARBALLS = $(PACKAGE)_$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--sysconfdir=/etc/syslog-ng \
	--datadir=$(prefix)/share/syslog-ng \
	--disable-glibtest \
	--disable-mongodb \
	--disable-json

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--enable-systemd \
	--with-systemdsystemunitdir=$(prefix)/lib/systemd/system
endif

prunefiles = \
	$(prefix)/lib/*.la \
	$(prefix)/lib/syslog-ng/*.la

stripfiles = \
	$(prefix)/bin/loggen \
	$(prefix)/bin/pdbtool \
	$(prefix)/lib/syslog-ng/*.so \
	$(prefix)/lib/*.so \
	$(prefix)/sbin/syslog-ng \
	$(prefix)/sbin/syslog-ng-ctl
