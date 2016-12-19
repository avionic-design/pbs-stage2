PACKAGE = libpcap
VERSION = 1.8.1
LICENSE = BSD

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-pcap=linux \
	--enable-ipv6 \
	--enable-shared

conf-vars += \
	ac_cv_linux_vers=2

ifeq ($(CONFIG_PACKAGE_LIBS_LIBNL),n)
conf-args += \
	--with-libnl=$(SYSROOT)$(prefix)

conf-vars += \
	CFLAGS="$(CFLAGS) -I$(SYSROOT)$(prefix)/include/libnl3"
else
conf-args += \
	--without-libnl
endif

config-scriptfiles = \
	$(prefix)/bin/pcap-config

stripfiles = \
	$(prefix)/lib/*.so.*
