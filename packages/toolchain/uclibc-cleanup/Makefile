PACKAGE = uClibc
VERSION = $(LIBC_VERSION)

LOCATION =
TARBALLS =

##############################################################################

include packages/toolchain/common.mk

exec-prefix = $(prefix)/$(TARGET)

package-configure:
	@:

package-build:
	@:

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

package-install: package-cleanup
	@:

package-clean:
	@:

