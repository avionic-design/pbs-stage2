PACKAGE = nss
VERSION = 3.12.9

LOCATION = ftp://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(VERSION))_RTM/src
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup:
	mkdir -p $(pkgtree)/build
	$(call cmd,stamp)

use-64 = $(if $(findstring x86_64,$(shell uname -m)),USE_64=1,)

conf-vars = \
	NS_USE_GCC=1 $(use-64) CC=gcc BUILD_TREE="$(pkgtree)/build"

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree)/mozilla/security/nss && \
		$(env) $(MAKE) $(conf-vars) build_coreconf
	$(call cmd,stamp)

common-vars = \
	OS_ARCH=Linux OS_RELEASE=2.6 OS_TEST=$(CONFIG_ARCH) \
	CPU_ARCH=$(CONFIG_ARCH) CROSS_COMPILE=1 \
	BUILD_TREE="$(pkgtree)/build" \
	NS_USE_GCC=1

build-vars = \
	$(common-vars) \
	NATIVE_CC="gcc" \
	CC="$(CC)" \
	STANDARDS_CFLAGS="$(CFLAGS)" \
	DSO_LDOPTS="-shared -Wl,-z,defs $(LDFLAGS)" \
	NSPR_INCLUDE_DIR="$(SYSROOT)$(prefix)/include/nspr"

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/mozilla/security/nss && \
		$(env) $(MAKE) $(build-vars) build_dbm all
	$(call cmd,stamp)

install-vars = \
	$(common-vars) CC="$(CC)" \
	SOURCE_BIN_DIR=$(DESTDIR)$(prefix)/bin \
	SOURCE_LIB_DIR=$(DESTDIR)$(prefix)/lib \
	NSDISTMODE=copy

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/mozilla/security/nss && \
		$(priv) $(env) $(MAKE) $(install-vars) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/addbuiltin \
	$(prefix)/bin/atob \
	$(prefix)/bin/baddbdir \
	$(prefix)/bin/bltest \
	$(prefix)/bin/btoa \
	$(prefix)/bin/certcgi \
	$(prefix)/bin/certutil \
	$(prefix)/bin/checkcert \
	$(prefix)/bin/cmsutil \
	$(prefix)/bin/conflict \
	$(prefix)/bin/crlutil \
	$(prefix)/bin/crmftest \
	$(prefix)/bin/dbtest \
	$(prefix)/bin/derdump \
	$(prefix)/bin/dertimetest \
	$(prefix)/bin/digest \
	$(prefix)/bin/fipstest \
	$(prefix)/bin/makepqg \
	$(prefix)/bin/mangle \
	$(prefix)/bin/modutil \
	$(prefix)/bin/multinit \
	$(prefix)/bin/nonspr10 \
	$(prefix)/bin/ocspclnt \
	$(prefix)/bin/oidcalc \
	$(prefix)/bin/p7content \
	$(prefix)/bin/p7env \
	$(prefix)/bin/p7sign \
	$(prefix)/bin/p7verify \
	$(prefix)/bin/pk11mode \
	$(prefix)/bin/pk12util \
	$(prefix)/bin/pp \
	$(prefix)/bin/remtest \
	$(prefix)/bin/rsaperf \
	$(prefix)/bin/sdrtest \
	$(prefix)/bin/selfserv \
	$(prefix)/bin/shlibsign \
	$(prefix)/bin/signtool \
	$(prefix)/bin/signver \
	$(prefix)/bin/ssltap \
	$(prefix)/bin/strsclnt \
	$(prefix)/bin/symkeyutil \
	$(prefix)/bin/tstclnt \
	$(prefix)/bin/vfychain \
	$(prefix)/bin/vfyserv \
	$(prefix)/lib/*.so

include packages/cleanup.mk
include packages/binary.mk
