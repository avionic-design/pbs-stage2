PACKAGE = syslog-ng
VERSION = 3.9.1
LICENSE = LGPL/GPL

LOCATION = https://github.com/balabit/$(PACKAGE)/releases/download/$(PACKAGE)-$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-sysroot=$(SYSROOT) \
	--sysconfdir=/etc/syslog-ng \
	--datadir=$(prefix)/share/syslog-ng \
	--disable-glibtest \
	--disable-mongodb \
	--disable-json \
	--disable-java

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
