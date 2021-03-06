include packages/devel/glibc/Makefile.location
include packages/autotools.mk

KERNEL_PACKAGE := linux
KERNEL_VERSION := $(shell cat $(objtree)/build/packages/kernel/$(KERNEL_PACKAGE)/build/include/config/kernel.release)
KERNEL_VERSION_TUPLE = $(word 1, $(subst -, ,$(KERNEL_VERSION)))
KERNEL_VERSION_MAJOR = $(word 1, $(subst ., ,$(KERNEL_VERSION_TUPLE)))
KERNEL_VERSION_MINOR = $(word 2, $(subst ., ,$(KERNEL_VERSION_TUPLE)))
KERNEL_VERSION_GLIBC = $(KERNEL_VERSION_MAJOR).$(KERNEL_VERSION_MINOR)

# for non x86 or x86_64 targets, Kernel support pre 3.20 ended with glibc 2.23.
ifeq (,$(findstring x86,$(ARCH)))
  ifneq "3.20" "$(word 1, $(sort 3.20 $(KERNEL_VERSION_GLIBC)))"
    VERSION := 2.23
  endif
endif

# always optimize glibc for speed (it won't even compile with -Os)
CPPFLAGS := $(subst --sysroot $(SYSROOT),,$(CPPFLAGS))
LDFLAGS := $(subst --sysroot $(SYSROOT),,$(LDFLAGS))
CFLAGS := $(subst --sysroot $(SYSROOT),,$(CFLAGS))
CFLAGS := $(patsubst -O%,-O2,$(CFLAGS))

conf-args = \
	--host=$(TARGET) \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--with-headers=$(SYSROOT)$(prefix)/include \
	--enable-addons=nptl,libidn \
	--enable-obsolete-rpc

ifneq ($(CONFIG_ARCH_HAS_HARD_FLOAT),y)
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

  ifeq ($(MACHINE),i686)
    conf-vars += CFLAGS='-march=i686 -O2 -g'
  endif

  ifeq ($(MACHINE),i786)
    conf-vars += CFLAGS='-march=prescott -O2 -g'
  endif
endif

ifeq ($(ARCH),x86_64)
  conf-vars += ac_cv_sizeof_long_double=16
endif

ifeq ($(MICRO),0)
  LIB_VERSION = $(MAJOR).$(MINOR)
else
  ifeq ($(MICRO),)
    LIB_VERSION = $(MAJOR).$(MINOR)
  else
    LIB_VERSION = $(MAJOR).$(MINOR).$(MICRO)
  endif
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
	$(prefix)/bin/makedb \
	$(prefix)/bin/pcprofiledump \
	$(prefix)/bin/rpcgen \
	$(prefix)/bin/sprof \
	$(prefix)/lib/audit/*.so \
	$(prefix)/lib/gconv/*.so \
	$(prefix)/libexec/pt_chown \
	$(prefix)/sbin/iconvconfig \
	$(prefix)/sbin/nscd \
	$(prefix)/sbin/rpcinfo \
	$(prefix)/sbin/zdump \
	$(prefix)/sbin/zic

$(pkgtree)/build/obj-$(HOST_GNU_TYPE)/configparms: $(pkgtree)/.patch
	@mkdir -p $(@D)
	@echo "CPPFLAGS += $(CPPFLAGS)"  > $@
	@echo "CFLAGS   += $(CFLAGS)"   >> $@
	@echo "CXXFLAGS += $(CFLAGS)"   >> $@
	@echo "ASFLAGS  += $(CFLAGS)"   >> $@
	@echo "LDFLAGS  += $(LDFLAGS)"  >> $@

$(pkgtree)/.configure: $(pkgtree)/build/obj-$(HOST_GNU_TYPE)/configparms
