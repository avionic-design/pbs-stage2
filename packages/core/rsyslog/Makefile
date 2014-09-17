PACKAGE = rsyslog
VERSION = 6.4.1
LICENSE = GPL

LOCATION = http://www.rsyslog.com/files/download/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=$(prefix)/lib/systemd/system
endif

prunefiles = \
	$(prefix)/lib/rsyslog/*.la

stripfiles = \
	$(prefix)/lib/rsyslog/*.so \
	$(prefix)/sbin/rsyslogd
