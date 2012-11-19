PACKAGE = nss
VERSION = 3.14
LICENSE = MPL

LOCATION = ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(VERSION))_RTM/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	mkdir -p $(pkgtree)/build
	$(call cmd,stamp)

use-64 = $(if $(findstring x86_64,$(shell uname -m)),USE_64=1,)
DISTDIR = $(pkgtree)/build/dist

common-vars = \
	MOZILLA_CLIENT=1 \
	OS_ARCH=Linux \
	OS_RELEASE=2.6 \
	OS_TEST=$(CONFIG_ARCH) \
	CPU_ARCH=$(CONFIG_ARCH) \
	BUILD_TREE='$(pkgtree)/build' \
	NSPR_INCLUDE_DIR='$(SYSROOT)$(prefix)/include/nspr' \
	NSPR_LIB_DIR='$(SYSROOT)$(prefix)/lib' \
	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
	SOURCE_MD_DIR='$(DISTDIR)' \
	NSS_USE_SYSTEM_SQLITE=1 \
	DIST='$(DISTDIR)' \
	NS_ENABLE_ECC=1 \
	NS_USE_GCC=1 \
	BUILD_OPT=1 \
	CHECKLOC=

conf-vars = \
	$(common-vars) $(use-64) CC=gcc

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree)/mozilla/security/nss && \
		$(env) $(MAKE) $(conf-vars) build_coreconf
	$(call cmd,stamp)

build-vars = \
	$(common-vars) \
	CROSS_COMPILE=1 \
	NATIVE_CC='gcc' \
	CC='$(CC)' \
	OPTIMIZER='$(CFLAGS)' \
	DSO_LDOPTS='-shared -Wl,-z,defs $(LDFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/mozilla/security/nss && \
		$(env) $(MAKE) $(build-vars) build_dbm all
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	$(INSTALL) -m 755 -d $(DESTDIR)$(prefix)/lib && \
		$(INSTALL) -m 644 -t $(DESTDIR)$(prefix)/lib \
			$(DISTDIR)/lib/libnss3.so \
			$(DISTDIR)/lib/libnssutil3.so \
			$(DISTDIR)/lib/libsmime3.so \
			$(DISTDIR)/lib/libssl3.so
	$(INSTALL) -m 644 -t $(DESTDIR)$(prefix)/lib \
		$(DISTDIR)/lib/libfreebl3.so \
		$(DISTDIR)/lib/libsoftokn3.so \
		$(DISTDIR)/lib/libnssdbm3.so \
		$(DISTDIR)/lib/libnssckbi.so
	$(INSTALL) -m 755 -d $(DESTDIR)$(prefix)/bin && \
		$(INSTALL) -m 755 -t $(DESTDIR)$(prefix)/bin \
			$(DISTDIR)/bin/certutil \
			$(DISTDIR)/bin/cmsutil \
			$(DISTDIR)/bin/crlutil \
			$(DISTDIR)/bin/modutil \
			$(DISTDIR)/bin/pk12util \
			$(DISTDIR)/bin/shlibsign \
			$(DISTDIR)/bin/signtool \
			$(DISTDIR)/bin/signver \
			$(DISTDIR)/bin/ssltap \
			$(DISTDIR)/bin/pwdecrypt
	$(INSTALL) -m 755 -d $(DESTDIR)$(prefix)/include/nss && \
		$(INSTALL) -m 644 -t $(DESTDIR)$(prefix)/include/nss \
			$(DISTDIR)/public/nss/*.h
	$(INSTALL) -m 644 -t $(DESTDIR)$(prefix)/lib \
		$(DISTDIR)/lib/libcrmf.a
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/certutil \
	$(prefix)/bin/cmsutil \
	$(prefix)/bin/crlutil \
	$(prefix)/bin/modutil \
	$(prefix)/bin/pk12util \
	$(prefix)/bin/pwdecrypt \
	$(prefix)/bin/shlibsign \
	$(prefix)/bin/signtool \
	$(prefix)/bin/signver \
	$(prefix)/bin/ssltap \
	$(prefix)/lib/*.so

include packages/cleanup.mk
include packages/binary.mk
