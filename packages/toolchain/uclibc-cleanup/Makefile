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
	$(ROOTFS)$(exec-prefix)/lib/libc.a \
	$(ROOTFS)$(exec-prefix)/lib/libc.so \
	$(ROOTFS)$(exec-prefix)/lib/libc_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libcrypt.a \
	$(ROOTFS)$(exec-prefix)/lib/libcrypt.so \
	$(ROOTFS)$(exec-prefix)/lib/libcrypt_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libdl.a \
	$(ROOTFS)$(exec-prefix)/lib/libdl.so \
	$(ROOTFS)$(exec-prefix)/lib/libdl_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libm.a \
	$(ROOTFS)$(exec-prefix)/lib/libm.so \
	$(ROOTFS)$(exec-prefix)/lib/libm_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libnsl.a \
	$(ROOTFS)$(exec-prefix)/lib/libnsl.so \
	$(ROOTFS)$(exec-prefix)/lib/libnsl_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libpthread.a \
	$(ROOTFS)$(exec-prefix)/lib/libpthread.so \
	$(ROOTFS)$(exec-prefix)/lib/libpthread_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libresolv.a \
	$(ROOTFS)$(exec-prefix)/lib/libresolv.so \
	$(ROOTFS)$(exec-prefix)/lib/libresolv_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/librt.a \
	$(ROOTFS)$(exec-prefix)/lib/librt.so \
	$(ROOTFS)$(exec-prefix)/lib/librt_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/libutil.a \
	$(ROOTFS)$(exec-prefix)/lib/libutil.so \
	$(ROOTFS)$(exec-prefix)/lib/libutil_pic.a \
	$(ROOTFS)$(exec-prefix)/lib/uclibc_nonshared.a

include packages/cleanup.mk

package-install: _cleanup
	@:

package-clean:
	@:

