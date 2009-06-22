PACKAGE = glibc
VERSION = $(LIBC_VERSION)

LOCATION =
TARBALLS =

##############################################################################

include packages/toolchain/common.mk

CROSS_COMPILE	:= $(SYSROOT)$(prefix)/bin/$(TARGET)-
exec-prefix	 = $(prefix)/$(TARGET)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(pkgtree)/.binary:
	$(call cmd,stamp)

prunefiles = \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libanl.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libanl.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libBrokenLocale.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libBrokenLocale.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libc.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libc.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libc_nonshared.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libcrypt.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libcrypt.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libdl.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libdl.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libm.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libm.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libnsl.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libnsl.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libpthread.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libpthread.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libpthread_nonshared.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libresolv.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libresolv.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/librt.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/librt.so \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libutil.a \
	$(SYSROOT)$(exec-prefix)/sys-root/lib/libutil.so

include packages/cleanup.mk

includedir = $(shell $(CROSS_COMPILE)gcc -print-file-name=include)

$(pkgtree)/.install: $(pkgtree)/.cleanup
	ln -sf ../../../../../sys-root/usr/include/byteswap.h \
		$(includedir)
	mkdir -p $(includedir)/bits
	ln -sf ../../../../../../sys-root/usr/include/bits/byteswap.h \
		$(includedir)/bits
	$(call cmd,stamp)
