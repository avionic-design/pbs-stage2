PACKAGE = dhcp
VERSION = 4.3.5

LOCATION = http://ftp.isc.org/isc/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-libbind=$(SYSROOT)$(prefix) \
	--with-randomdev=/dev/random \
	--enable-silent-rules

BIND_LDFLAGS = -lpthread -lssl -lcrypto

conf-vars += \
	LDFLAGS="$(LDFLAGS) $(BIND_LDFLAGS)"

stripfiles = \
	$(prefix)/bin/omshell \
	$(prefix)/sbin/dhclient \
	$(prefix)/sbin/dhcpd \
	$(prefix)/sbin/dhcrelay
