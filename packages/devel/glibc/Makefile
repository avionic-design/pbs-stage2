PACKAGE = glibc
VERSION = 2.7

LOCATION = ftp://ftp.gnu.org/pub/gnu/$(PACKAGE)
TARBALLS = \
	$(PACKAGE_FULLNAME).tar.bz2 \
	$(PACKAGE)-ports-$(VERSION).tar.bz2

DESCRIPTION = the GNU C library

##############################################################################

include packages/autotools.mk

env  = env -i PATH=$(srctree)/platform/toolchain/$(TOOLCHAIN)/usr/bin:/usr/bin:/bin

# always optimize glibc for speed (it won't even compile with -Os)
CFLAGS := $(patsubst -O%,-O2,$(CFLAGS))

package-extract:
	cd $(pkgtree) && ln -sf ../$(PACKAGE)-ports-$(VERSION) ports

conf-args += \
	--with-headers=$(ROOTFS)/usr/include \
	--enable-addons=ports \
	--disable-sanity-checks

ifeq ($(FLOAT),soft)
	conf-args += --without-fp
endif

conf-vars += \
	libc_cv_forced_unwind=yes \
	libc_cv_c_cleanup=yes \
	libc_cv_$(ARCH)_tls=yes \
	ac_cv_sizeof_long_double=8 \
	$(call set-args, LDFLAGS)

build-args += \
	MAKEFLAGS= \
	all

install-args += \
	install_root=$(ROOTFS)

#LIBRARIES = \
	ld-$(VERSION).so \
	libnss_compat-$(VERSION).so \
	libutil-$(VERSION).so \
	libc-$(VERSION).so \
	libpthread-$(VERSION).so \
	libthread_db-1.0.so \
	libanl-$(VERSION).so \
	libm-$(VERSION).so \
	librt-$(VERSION).so \
	libresolv-$(VERSION).so \
	libcrypt-$(VERSION).so \
	libnss_nisplus-$(VERSION).so \
	libmemusage.so \
	libnss_files-$(VERSION).so \
	libSegFault.so \
	libpcprofile.so \
	libnss_hesiod-$(VERSION).so \
	libnss_dns-$(VERSION).so \
	libBrokenLocale-$(VERSION).so \
	libnss_nis-$(VERSION).so \
	libdl-$(VERSION).so \
	libnsl-$(VERSION).so

#package-post-install:
#	@for l in $(addprefix $(ROOTFS)/lib/,$(LIBRARIES)) $(wildcard $(ROOTFS)$(prefix)/lib/gconv/*.so); do \
#		echo "STRIP   $$l"; \
#		$(priv) $(STRIP) $$l; \
#	done

package-post-install:
	$(priv) cp `$(CC) --print-file-name=libgcc_s.so.1` $(ROOTFS)/lib
	$(priv) $(STRIP) $(ROOTFS)/lib/libgcc_s.so.1

package-clean:
	@:

