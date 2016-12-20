PACKAGE = openntpd
VERSION = 6.0p1

LOCATION = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

stripfiles = \
	$(prefix)/sbin/ntpctl \
	$(prefix)/sbin/ntpd
