PACKAGE = tcpdump
VERSION = 4.6.2
LICENSE = BSD

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--without-crypto \
	--enable-ipv6 \
	--disable-smb

conf-vars += \
	td_cv_buggygetaddrinfo=no

prunefiles = \
	$(prefix)/sbin/tcpdump.$(VERSION)

stripfiles = \
	$(prefix)/sbin/tcpdump
