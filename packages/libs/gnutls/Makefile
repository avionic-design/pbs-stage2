PACKAGE = gnutls
VERSION = 2.8.1

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-libgcrypt-prefix=$(ROOTFS)$(prefix)

sover = 26.14.8

prunefiles = \
	$(prefix)/lib/libgnutls-extra.la \
	$(prefix)/lib/libgnutls-openssl.la \
	$(prefix)/lib/libgnutlsxx.la \
	$(prefix)/lib/libgnutls.la

stripfiles = \
	$(prefix)/bin/certtool \
	$(prefix)/bin/gnutls-cli \
	$(prefix)/bin/gnutls-cli-debug \
	$(prefix)/bin/gnutls-serv \
	$(prefix)/bin/psktool \
	$(prefix)/bin/srptool \
	$(prefix)/lib/libgnutls-extra.so.$(sover) \
	$(prefix)/lib/libgnutls-openssl.so.$(sover) \
	$(prefix)/lib/libgnutlsxx.so.$(sover) \
	$(prefix)/lib/libgnutls.so.$(sover)
