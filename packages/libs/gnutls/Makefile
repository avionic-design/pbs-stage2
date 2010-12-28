PACKAGE = gnutls
VERSION = 2.10.4

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-libgcrypt-prefix=$(SYSROOT)$(prefix) \
	--with-libtasn1-prefix=$(SYSROOT)$(prefix)

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/certtool \
	$(prefix)/bin/gnutls-cli \
	$(prefix)/bin/gnutls-cli-debug \
	$(prefix)/bin/gnutls-serv \
	$(prefix)/bin/psktool \
	$(prefix)/bin/srptool \
	$(prefix)/lib/*.so.*
