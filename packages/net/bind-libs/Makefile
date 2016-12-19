PACKAGE = bind
VERSION = 9.11.0-P1

LOCATION = http://ftp.isc.org/isc/bind9/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--with-randomdev=/dev/random \
	--disable-linux-caps \
	--disable-symtable \
	--with-libxml2=no \
	--enable-shared \
	--enable-static \
	--enable-epoll \
	--with-gssapi=no \
	--with-openssl=$(SYSROOT)$(prefix) \
	--with-libtool \
	--with-ecdsa \
	--without-gost

conf-vars += \
	BUILD_CC=gcc

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
