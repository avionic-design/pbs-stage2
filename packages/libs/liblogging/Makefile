PACKAGE = liblogging
VERSION = 1.0.4
LICENSE = BSD

LOCATION = http://download.rsyslog.com/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-man-pages

ifeq ($(CONFIG_PACKAGE_LIBS_LIBLOGGING_SYSTEMD),y)
  conf-args += --enable-journal
else
  conf-args += --disable-journal
endif

stripfiles = \
	$(prefix)/bin/stdlogctl \
	$(prefix)/lib/*.so.*

prunefiles = \
	$(prefix)/lib/liblogging-stdlog.la
