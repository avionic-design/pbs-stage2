PACKAGE = rsyslog
VERSION = 8.4.2
LICENSE = GPL

LOCATION = http://www.rsyslog.com/files/download/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

CFLAGS += -std=c99

conf-args += \
	--disable-generate-man-pages \
	--disable-libgcrypt

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=$(prefix)/lib/systemd/system
endif

prunefiles = \
	$(prefix)/lib/rsyslog/*.la

stripfiles = \
	$(prefix)/lib/rsyslog/*.so \
	$(prefix)/sbin/rsyslogd
