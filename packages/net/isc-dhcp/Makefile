PACKAGE = dhcp
VERSION = 4.3.5

LOCATION = http://ftp.isc.org/isc/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-libbind=$(SYSROOT)$(prefix) \
	--with-randomdev=/dev/random \
	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
	--with-cli-lease-file=/var/lib/dhcp/dhclient.leases \
	--with-cli6-lease-file=/var/lib/dhcp/dhclient6.leases \
	--with-srv-pid-file=/var/run/dhcpd.pid \
	--with-srv6-pid-file=/var/run/dhcpd6.pid \
	--with-cli-pid-file=/var/run/dhclient.pid \
	--with-cli6-pid-file=/var/run/dhclient6.pid \
	--with-relay-pid-file=/var/run/dhcrelay.pid \
	--with-relay6-pid-file=/var/run/dhcrelay6.pid \
	--enable-silent-rules

BIND_LDFLAGS = -lpthread -lssl -lcrypto

conf-vars += \
	LDFLAGS="$(LDFLAGS) $(BIND_LDFLAGS)"

stripfiles = \
	$(prefix)/bin/omshell \
	$(prefix)/sbin/dhclient \
	$(prefix)/sbin/dhcpd \
	$(prefix)/sbin/dhcrelay
