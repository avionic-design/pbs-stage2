include packages/common.mk

conf-cmd ?= $(pkgbuildtree)/configure

conf-args += \
	--build=$(BUILD_GNU_TYPE) \
	--host=$(HOST_GNU_TYPE) \
	--prefix=$(prefix) \
	--mandir=$(prefix)/share/man \
	--infodir=$(prefix)/share/info \
	--localstatedir=/var \
	--sysconfdir=/etc

conf-vars += \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

install-args += \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.setup:
	$(call cmd,stamp)

include packages/cleanup.mk
include packages/binary.mk
