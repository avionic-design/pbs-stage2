PACKAGE = gnutls
VERSION = 2.12.14

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools-reconf.mk

conf-args += \
	--with-libgcrypt \
	--with-libgcrypt-prefix=$(SYSROOT)$(prefix) \
	--with-libtasn1-prefix=$(SYSROOT)$(prefix) \
	--with-libdl-prefix=$(SYSROOT)$(prefix) \
	--with-libz-prefix=$(SYSROOT)$(prefix) \
	--disable-rpath

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/certtool \
	$(prefix)/bin/gnutls-cli \
	$(prefix)/bin/gnutls-cli-debug \
	$(prefix)/bin/gnutls-serv \
	$(prefix)/bin/p11tool \
	$(prefix)/bin/psktool \
	$(prefix)/bin/srptool \
	$(prefix)/lib/*.so.*
