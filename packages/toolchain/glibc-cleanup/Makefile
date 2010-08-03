PACKAGE = glibc
VERSION = 2.11

include packages/toolchain/common.mk
DESTDIR := $(sysroot)
prefix := /usr
export DESTDIR

prunefiles = \
	$(prefix)/lib/libanl.a \
	$(prefix)/lib/libanl.so \
	$(prefix)/lib/libBrokenLocale.a \
	$(prefix)/lib/libBrokenLocale.so \
	$(prefix)/lib/libc.a \
	$(prefix)/lib/libc.so \
	$(prefix)/lib/libc_nonshared.a \
	$(prefix)/lib/libcrypt.a \
	$(prefix)/lib/libcrypt.so \
	$(prefix)/lib/libdl.a \
	$(prefix)/lib/libdl.so \
	$(prefix)/lib/libm.a \
	$(prefix)/lib/libm.so \
	$(prefix)/lib/libnsl.a \
	$(prefix)/lib/libnsl.so \
	$(prefix)/lib/libpthread.a \
	$(prefix)/lib/libpthread.so \
	$(prefix)/lib/libpthread_nonshared.a \
	$(prefix)/lib/libresolv.a \
	$(prefix)/lib/libresolv.so \
	$(prefix)/lib/librt.a \
	$(prefix)/lib/librt.so \
	$(prefix)/lib/libutil.a \
	$(prefix)/lib/libutil.so

include packages/cleanup.mk

$(pkgtree)/.install: $(pkgtree)/.cleanup
	$(call cmd,stamp)
