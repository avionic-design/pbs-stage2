PACKAGE = glibc
VERSION = 2.12.1

LOCATION = http://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE)-$(VERSION).tar.xz \
	$(PACKAGE)-ports-$(VERSION).tar.xz

include packages/common.mk

# always optimize glibc for speed (it won't even compile with -Os)
CFLAGS := $(patsubst -O%,-O2,$(CFLAGS))

$(pkgtree)/.setup:
	cd $(pkgbuildtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--with-headers=$(SYSROOT)$(prefix)/include \
	--enable-addons=ports

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes

ifeq ($(ARCH),arm)
  conf-vars += ac_cv_sizeof_long_double=8
endif

ifeq ($(ARCH),x86)
  conf-vars += ac_cv_sizeof_long_double=8

  ifeq ($(CPU),i686)
    conf-vars += CFLAGS='-march=i686 -O2 -g'
  endif

  ifeq ($(CPU),i786)
    conf-vars += CFLAGS='-march=prescott -O2 -g'
  endif
endif

ifeq ($(ARCH),x86_64)
  conf-vars += ac_cv_sizeof_long_double=16
endif

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	MAKEFLAGS=

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) -j $(NUM_CPU) $(build-args) all
	$(call cmd,stamp)

install-args = \
	install_root=$(DESTDIR)

LIBGCC = $(env) $(CC) --print-file-name=libgcc_s.so.1
LIBGXX = $(env) $(CC) --print-file-name=libstdc++.so.6
plugin = $(prefix)/lib/gconv

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(priv) cp $(shell $(LIBGCC)) $(DESTDIR)/lib
	$(priv) cp $(shell $(LIBGXX)) $(DESTDIR)/lib
	$(call cmd,stamp)

stripfiles = \
	/lib/$(notdir $(shell $(LIBGCC))) \
	/lib/$(notdir $(shell $(LIBGXX))) \
	/lib/ld-$(VERSION).so \
	/lib/libanl-$(VERSION).so \
	/lib/libBrokenLocale-$(VERSION).so \
	/lib/libc-$(VERSION).so \
	/lib/libcidn-$(VERSION).so \
	/lib/libcrypt-$(VERSION).so \
	/lib/libdl-$(VERSION).so \
	/lib/libm-$(VERSION).so \
	/lib/libmemusage.so \
	/lib/libnsl-$(VERSION).so \
	/lib/libnss_compat-$(VERSION).so \
	/lib/libnss_dns-$(VERSION).so \
	/lib/libnss_files-$(VERSION).so \
	/lib/libnss_hesiod-$(VERSION).so \
	/lib/libnss_nis-$(VERSION).so \
	/lib/libnss_nisplus-$(VERSION).so \
	/lib/libpcprofile.so \
	/lib/libpthread-$(VERSION).so \
	/lib/libresolv-$(VERSION).so \
	/lib/librt-$(VERSION).so \
	/lib/libSegFault.so \
	/lib/libthread_db-1.0.so \
	/lib/libutil-$(VERSION).so \
	/sbin/ldconfig \
	/sbin/sln \
	$(prefix)/bin/gencat \
	$(prefix)/bin/getconf \
	$(prefix)/bin/getent \
	$(prefix)/bin/iconv \
	$(prefix)/bin/lddlibc4 \
	$(prefix)/bin/locale \
	$(prefix)/bin/localedef \
	$(prefix)/bin/pcprofiledump \
	$(prefix)/bin/rpcgen \
	$(prefix)/bin/sprof \
	$(prefix)/libexec/pt_chown \
	$(prefix)/sbin/iconvconfig \
	$(prefix)/sbin/nscd \
	$(prefix)/sbin/rpcinfo \
	$(prefix)/sbin/zdump \
	$(prefix)/sbin/zic \
	$(plugin)/*.so

include packages/cleanup.mk
include packages/binary.mk
