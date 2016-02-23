include packages/devel/python/Makefile.location
include packages/common.mk

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--host=$(HOST_GNU_TYPE) \
	--build=$(BUILD_GNU_TYPE) \
	--prefix=$(prefix) \
	--infodir=$(prefix)/share/info \
	--mandir=$(prefix)/share/man \
	--sysconfdir=/etc \
	--with-cxx-main=$(TARGET)-g++ \
	--enable-ipv6

conf-args += \
	--with-system-ffi

conf-vars = \
	ac_cv_file__dev_ptmx=no \
	ac_cv_file__dev_ptc=no

$(pkgtree)/.configure: $(pkgtree)/.patch
	mkdir -p $(pkgbuildtree)/obj-$(TARGET) && \
		cd $(pkgbuildtree)/obj-$(TARGET) && \
			$(env) ../configure $(conf-args) $(conf-vars)
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree)/obj-$(TARGET) && \
		$(env) $(MAKE) $(build-args)
	$(call cmd,stamp)

install-args = \
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
