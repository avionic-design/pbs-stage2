PACKAGE = libsoup
VERSION = 2.31.2

LOCATION = http://ftp.acc.umu.se/pub/gnome/sources/libsoup/2.31
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--without-gnome

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
