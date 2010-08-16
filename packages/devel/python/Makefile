PACKAGE = Python
VERSION = 3.1.2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://python.org/ftp/python/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(TARGET) \
	--target=$(TARGET) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--with-cxx-main=$(TARGET)-g++

conf-args += \
	--with-system-ffi

conf-vars = \
	CPPFLAGS='$(CPPFLAGS)' \
	CFLAGS='$(CFLAGS)' \
	CXXFLAGS='$(CXXFLAGS)' \
	LDFLAGS='$(LDFLAGS)'

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

build-args = \
	EXTRA_CFLAGS='$(CFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
	EXTRA_CFLAGS='$(CFLAGS)' \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

module = $(prefix)/lib/python$(MAJOR).$(MINOR)

stripfiles = \
	$(prefix)/bin/python$(MAJOR).$(MINOR) \
	$(module)/lib-dynload/*.so

include packages/cleanup.mk
include packages/binary.mk
