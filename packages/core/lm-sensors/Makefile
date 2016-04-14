PACKAGE = lm_sensors
VERSION = 3.3.5
LICENSE = GPL LGPL

LOCATION = http://http.debian.net/debian/pool/main/l/$(subst _,-,$(PACKAGE))
TARBALLS = $(subst _,-,$(PACKAGE))_$(VERSION).orig.tar.bz2;filename=$(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

build-args = \
	CC='$(CC)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)' \
	EXLDFLAGS='$(LDFLAGS)'

# lm-sensors iconv detection uses host ldconfig, so preset it here. Flag is
# needed for glibc builds with iconv package selected only though.
ifeq ($(CONFIG_GLIBC),y)
ifeq ($(CONFIG_PACKAGE_LIBS_ICONV),y)
build-args += \
	LIBICONV='-liconv'
endif
else
build-args += \
	LIBICONV=''
endif

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	DESTDIR='$(DESTDIR)' \
	PREFIX='$(prefix)' \
	MANDIR='$(prefix)/share/man'

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(priv) $(env) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/sensors \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/isadump \
	$(prefix)/sbin/isaset

include packages/cleanup.mk
include packages/binary.mk
