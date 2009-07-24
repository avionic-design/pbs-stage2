PACKAGE = glibc
VERSION = $(LIBC_VERSION)

LOCATION =
TARBALLS =

##############################################################################

include toolchains/packages/common.mk

CROSS_COMPILE	:= $(SYSROOT)$(prefix)/bin/$(TARGET)-
exec-prefix	:= $(prefix)/$(TARGET)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(pkgtree)/.binary:
	$(call cmd,stamp)

prunefiles = \
	$(exec-prefix)/sys-root/lib/libanl.a \
	$(exec-prefix)/sys-root/lib/libanl.so \
	$(exec-prefix)/sys-root/lib/libBrokenLocale.a \
	$(exec-prefix)/sys-root/lib/libBrokenLocale.so \
	$(exec-prefix)/sys-root/lib/libc.a \
	$(exec-prefix)/sys-root/lib/libc.so \
	$(exec-prefix)/sys-root/lib/libc_nonshared.a \
	$(exec-prefix)/sys-root/lib/libcrypt.a \
	$(exec-prefix)/sys-root/lib/libcrypt.so \
	$(exec-prefix)/sys-root/lib/libdl.a \
	$(exec-prefix)/sys-root/lib/libdl.so \
	$(exec-prefix)/sys-root/lib/libm.a \
	$(exec-prefix)/sys-root/lib/libm.so \
	$(exec-prefix)/sys-root/lib/libnsl.a \
	$(exec-prefix)/sys-root/lib/libnsl.so \
	$(exec-prefix)/sys-root/lib/libpthread.a \
	$(exec-prefix)/sys-root/lib/libpthread.so \
	$(exec-prefix)/sys-root/lib/libpthread_nonshared.a \
	$(exec-prefix)/sys-root/lib/libresolv.a \
	$(exec-prefix)/sys-root/lib/libresolv.so \
	$(exec-prefix)/sys-root/lib/librt.a \
	$(exec-prefix)/sys-root/lib/librt.so \
	$(exec-prefix)/sys-root/lib/libutil.a \
	$(exec-prefix)/sys-root/lib/libutil.so

include packages/cleanup.mk

includedir = $(shell $(CROSS_COMPILE)gcc -print-file-name=include)

$(pkgtree)/.install: $(pkgtree)/.cleanup
	ln -sf ../../../../../sys-root/usr/include/byteswap.h \
		$(includedir)
	mkdir -p $(includedir)/bits
	ln -sf ../../../../../../sys-root/usr/include/bits/byteswap.h \
		$(includedir)/bits
	$(call cmd,stamp)
