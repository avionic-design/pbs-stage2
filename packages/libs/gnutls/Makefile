PACKAGE = gnutls
VERSION = 3.1.8
LICENSE = GPL

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = ftp://ftp.gnutls.org/gcrypt/$(PACKAGE)/v$(MAJOR).$(MINOR)
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
	$(prefix)/bin/danetool \
	$(prefix)/bin/gnutls-cli \
	$(prefix)/bin/gnutls-cli-debug \
	$(prefix)/bin/gnutls-serv \
	$(prefix)/bin/ocsptool \
	$(prefix)/bin/p11tool \
	$(prefix)/bin/psktool \
	$(prefix)/bin/srptool \
	$(prefix)/lib/*.so.*
