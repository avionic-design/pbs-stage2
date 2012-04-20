PACKAGE = gnutls
VERSION = 3.0.20
LICENSE = GPL

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-args += \
	--with-libnettle-prefix=$(SYSROOT)$(prefix) \
	--with-libtasn1-prefix=$(SYSROOT)$(prefix) \
	--with-libz-prefix=$(SYSROOT)$(prefix) \
	--disable-rpath \
	--disable-doc

conf-vars += \
	gl_cv_func_gettimeofday_clobber=no

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/certtool \
	$(prefix)/bin/gnutls-cli \
	$(prefix)/bin/gnutls-cli-debug \
	$(prefix)/bin/gnutls-serv \
	$(prefix)/bin/ocsptool \
	$(prefix)/bin/p11tool \
	$(prefix)/bin/psktool \
	$(prefix)/bin/srptool \
	$(prefix)/lib/*.so.*
