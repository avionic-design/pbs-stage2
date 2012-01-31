PACKAGE = tcpdump
VERSION = 4.2.1

LOCATION = http://www.tcpdump.org/release
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--without-crypto \
	--enable-ipv6 \
	--disable-smb

conf-vars += \
	td_cv_buggygetaddrinfo=no \
	ac_cv_linux_vers=2

prunefiles = \
	$(prefix)/sbin/tcpdump.$(VERSION)

stripfiles = \
	$(prefix)/sbin/tcpdump
