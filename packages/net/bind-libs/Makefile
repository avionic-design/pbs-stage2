PACKAGE = bind
VERSION = 9.7.2-P2

LOCATION = http://ftp.isc.org/isc/bind9/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-randomdev=/dev/random \
	--with-export-includedir=$(prefix)/include \
	--with-export-libdir=$(prefix)/lib \
	--disable-linux-caps \
	--disable-symtable \
	--with-libxml2=no \
	--enable-exportlib \
	--enable-shared \
	--enable-static \
	--enable-epoll \
	--with-libtool

conf-vars += \
	BUILD_CC=gcc

build-args += \
	-C lib/export

install-args += \
	-C lib/export

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
