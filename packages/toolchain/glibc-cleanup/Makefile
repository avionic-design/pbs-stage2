PACKAGE = glibc
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
	$(ROOTFS)$(exec-prefix)/lib/libanl.a \
	$(ROOTFS)$(exec-prefix)/lib/libanl.so \
	$(ROOTFS)$(exec-prefix)/lib/libBrokenLocale.a \
	$(ROOTFS)$(exec-prefix)/lib/libBrokenLocale.so \
	$(ROOTFS)$(exec-prefix)/lib/libc.a \
	$(ROOTFS)$(exec-prefix)/lib/libc.so \
	$(ROOTFS)$(exec-prefix)/lib/libc_nonshared.a \
	$(ROOTFS)$(exec-prefix)/lib/libcrypt.a \
	$(ROOTFS)$(exec-prefix)/lib/libcrypt.so \
	$(ROOTFS)$(exec-prefix)/lib/libdl.a \
	$(ROOTFS)$(exec-prefix)/lib/libdl.so \
	$(ROOTFS)$(exec-prefix)/lib/libm.a \
	$(ROOTFS)$(exec-prefix)/lib/libm.so \
	$(ROOTFS)$(exec-prefix)/lib/libnsl.a \
	$(ROOTFS)$(exec-prefix)/lib/libnsl.so \
	$(ROOTFS)$(exec-prefix)/lib/libpthread.a \
	$(ROOTFS)$(exec-prefix)/lib/libpthread.so \
	$(ROOTFS)$(exec-prefix)/lib/libpthread_nonshared.a \
	$(ROOTFS)$(exec-prefix)/lib/libresolv.a \
	$(ROOTFS)$(exec-prefix)/lib/libresolv.so \
	$(ROOTFS)$(exec-prefix)/lib/librt.a \
	$(ROOTFS)$(exec-prefix)/lib/librt.so \
	$(ROOTFS)$(exec-prefix)/lib/libutil.a \
	$(ROOTFS)$(exec-prefix)/lib/libutil.so

include packages/cleanup.mk

package-install: package-cleanup
	@:

package-clean:
	@:

