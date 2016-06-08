PACKAGE = socat
VERSION = 1.7.3.1
LICENSE = GPLv2

LOCATION = http://www.dest-unreach.org/$(PACKAGE)/download
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += --disable-libwrap

ifneq ($(CONFIG_PACKAGE_UTIL_SOCAT_WITH_OPENSSL),y)
  conf-args += --disable-openssl
endif

ifneq ($(CONFIG_PACKAGE_UTIL_SOCAT_WITH_READLINE),y)
  conf-args += --disable-readline
endif

stripfiles = \
	$(prefix)/bin/filan \
	$(prefix)/bin/procan \
	$(prefix)/bin/socat
