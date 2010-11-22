PACKAGE = dhcp
VERSION = 4.2.0-P1

LOCATION = http://ftp.isc.org/isc/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-libbind=$(SYSROOT)$(prefix)

conf-vars += \
	ac_cv_file__dev_random=yes

stripfiles = \
	$(prefix)/bin/omshell \
	$(prefix)/sbin/dhclient \
	$(prefix)/sbin/dhcpd \
	$(prefix)/sbin/dhcrelay
