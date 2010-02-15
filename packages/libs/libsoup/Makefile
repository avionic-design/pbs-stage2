PACKAGE = libsoup
VERSION = 2.27.2

LOCATION = http://ftp.acc.umu.se/pub/gnome/sources/libsoup/2.27
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-gnome

prunefiles = \
	$(prefix)/lib/libsoup-2.4.la

stripfiles = \
	$(prefix)/lib/libsoup-2.4.so.1.2.0
