include packages/toolchain/uclibc/Makefile.location
include packages/toolchain/common.mk

DESTDIR := $(sysroot)
prefix := /usr
export DESTDIR

prunefiles = \
	$(prefix)/include/bits/uClibc_*.h \
	$(prefix)/lib/libc_pic.a \
	$(prefix)/lib/libc.a \
	$(prefix)/lib/libc.so \
	$(prefix)/lib/libcrypt_pic.a \
	$(prefix)/lib/libcrypt.a \
	$(prefix)/lib/libcrypt.so \
	$(prefix)/lib/libdl_pic.a \
	$(prefix)/lib/libdl.a \
	$(prefix)/lib/libdl.so \
	$(prefix)/lib/libm_pic.a \
	$(prefix)/lib/libm.a \
	$(prefix)/lib/libm.so \
	$(prefix)/lib/libnsl_pic.a \
	$(prefix)/lib/libnsl.a \
	$(prefix)/lib/libnsl.so \
	$(prefix)/lib/libpthread_pic.a \
	$(prefix)/lib/libpthread.a \
	$(prefix)/lib/libpthread.so \
	$(prefix)/lib/libresolv_pic.a \
	$(prefix)/lib/libresolv.a \
	$(prefix)/lib/libresolv.so \
	$(prefix)/lib/librt_pic.a \
	$(prefix)/lib/librt.a \
	$(prefix)/lib/librt.so \
	$(prefix)/lib/libutil_pic.a \
	$(prefix)/lib/libutil.a \
	$(prefix)/lib/libutil.so \
	$(prefix)/lib/uclibc_nonshared.a

include packages/cleanup.mk

$(pkgtree)/.install: $(pkgtree)/.cleanup
	$(call cmd,stamp)
