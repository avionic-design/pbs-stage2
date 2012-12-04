include packages/toolchain/glibc/Makefile.location
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
	--enable-obsolete-rpc \
	--enable-addons=ports

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_cv_ssp=no

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

plugin = $(prefix)/lib/gconv

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

ifneq ($(MICRO),0)
  LIB_VERSION = $(MAJOR).$(MINOR).$(MICRO)
else
  LIB_VERSION = $(MAJOR).$(MINOR)
endif

stripfiles = \
	/lib/ld-$(LIB_VERSION).so \
	/lib/libanl-$(LIB_VERSION).so \
	/lib/libBrokenLocale-$(LIB_VERSION).so \
	/lib/libc-$(LIB_VERSION).so \
	/lib/libcidn-$(LIB_VERSION).so \
	/lib/libcrypt-$(LIB_VERSION).so \
	/lib/libdl-$(LIB_VERSION).so \
	/lib/libm-$(LIB_VERSION).so \
	/lib/libmemusage.so \
	/lib/libnsl-$(LIB_VERSION).so \
	/lib/libnss_compat-$(LIB_VERSION).so \
	/lib/libnss_dns-$(LIB_VERSION).so \
	/lib/libnss_files-$(LIB_VERSION).so \
	/lib/libnss_hesiod-$(LIB_VERSION).so \
	/lib/libnss_nis-$(LIB_VERSION).so \
	/lib/libnss_nisplus-$(LIB_VERSION).so \
	/lib/libpcprofile.so \
	/lib/libpthread-$(LIB_VERSION).so \
	/lib/libresolv-$(LIB_VERSION).so \
	/lib/librt-$(LIB_VERSION).so \
	/lib/libSegFault.so \
	/lib/libthread_db-1.0.so \
	/lib/libutil-$(LIB_VERSION).so \
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
	$(prefix)/lib/audit/*.so \
	$(prefix)/libexec/pt_chown \
	$(prefix)/sbin/iconvconfig \
	$(prefix)/sbin/nscd \
	$(prefix)/sbin/rpcinfo \
	$(prefix)/sbin/zdump \
	$(prefix)/sbin/zic \
	$(plugin)/*.so

include packages/cleanup.mk
include packages/binary.mk
