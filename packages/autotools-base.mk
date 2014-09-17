include packages/common.mk

conf-cmd ?= $(pkgbuildtree)/configure

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--libdir=$(prefix)/lib \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	CXXFLAGS='$(CFLAGS)' \
	ASFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

# Fix a few typical autoconf tests
ifeq ($(CONFIG_LIBC),gnu)
conf-vars += \
	ac_cv_func_realloc_0_nonnull=yes \
	ac_cv_func_malloc_0_nonnull=yes
else
conf-vars += \
	ac_cv_func_realloc_0_nonnull=no \
	ac_cv_func_malloc_0_nonnull=no
endif
# Checking memcmp is obsolescent nowadays, hence always pass this test
conf-vars += ac_cv_func_memcmp_working=yes

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.setup:
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
