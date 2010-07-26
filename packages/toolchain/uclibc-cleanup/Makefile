PACKAGE = uClibc
VERSION = 0.9.31

include packages/toolchain/common.mk

CROSS_COMPILE := $(SYSROOT)$(prefix)/bin/$(TARGET)-
exec-prefix = $(SYSROOT)$(prefix)/$(TARGET)

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure:
	$(call cmd,stamp)

$(pkgtree)/.build:
	$(call cmd,stamp)

$(pkgtree)/.binary:
	$(call cmd,stamp)

prunefiles = \
	$(exec-prefix)/include/bits/uClibc_*.h \
	$(exec-prefix)/lib/libc_pic.a \
	$(exec-prefix)/lib/libc.a \
	$(exec-prefix)/lib/libc.so \
	$(exec-prefix)/lib/libcrypt_pic.a \
	$(exec-prefix)/lib/libcrypt.a \
	$(exec-prefix)/lib/libcrypt.so \
	$(exec-prefix)/lib/libdl_pic.a \
	$(exec-prefix)/lib/libdl.a \
	$(exec-prefix)/lib/libdl.so \
	$(exec-prefix)/lib/libm_pic.a \
	$(exec-prefix)/lib/libm.a \
	$(exec-prefix)/lib/libm.so \
	$(exec-prefix)/lib/libnsl_pic.a \
	$(exec-prefix)/lib/libnsl.a \
	$(exec-prefix)/lib/libnsl.so \
	$(exec-prefix)/lib/libpthread_pic.a \
	$(exec-prefix)/lib/libpthread.a \
	$(exec-prefix)/lib/libpthread.so \
	$(exec-prefix)/lib/libresolv_pic.a \
	$(exec-prefix)/lib/libresolv.a \
	$(exec-prefix)/lib/libresolv.so \
	$(exec-prefix)/lib/librt_pic.a \
	$(exec-prefix)/lib/librt.a \
	$(exec-prefix)/lib/librt.so \
	$(exec-prefix)/lib/libutil_pic.a \
	$(exec-prefix)/lib/libutil.a \
	$(exec-prefix)/lib/libutil.so \
	$(exec-prefix)/lib/uclibc_nonshared.a

include packages/cleanup.mk

includedir = $(shell $(CROSS_COMPILE)gcc -print-file-name=include)

$(pkgtree)/.install: $(pkgtree)/.cleanup
	ln -sf ../../../../../sys-root/usr/include/byteswap.h \
		$(includedir)
	mkdir -p $(includedir)/bits
	ln -sf ../../../../../../sys-root/usr/include/bits/byteswap.h \
		$(includedir)/bits
	$(call cmd,stamp)
