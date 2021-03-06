include packages/libs/openssl/Makefile.location
include packages/common.mk

$(pkgtree)/.setup:
	$(call cmd,stamp)

conf-args = \
	--cross-compile-prefix=$(TARGET)- \
	--prefix=$(prefix) \
	--openssldir=/etc/ssl \
	--enginesdir=/usr/lib/ssl/engines \
	shared zlib-dynamic

ifeq ($(CONFIG_ARCH),arm)
  ifeq ($(CONFIG_CPU),xscale)
    config = linux-generic32
  else
    config = linux-generic32
  endif
endif

ifeq ($(CONFIG_ARCH),x86)
  config = linux-generic32
endif

ifeq ($(CONFIG_ARCH),powerpc)
  config = linux-ppc
endif

ifneq ($(MAKECMDGOALS),watch)
  ifndef config
    $(error no configuration defined)
  endif
endif

$(pkgtree)/.configure: $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		$(env) ./Configure $(conf-args) $(config)
	$(call cmd,stamp)

build-vars = \
	EXTRA_CPPFLAGS='$(CPPFLAGS)' \
	EXTRA_CFLAGS='$(CFLAGS)'

$(pkgtree)/.build: $(pkgtree)/.configure
	cd $(pkgbuildtree) && \
		$(env) $(MAKE) $(build-args) $(build-vars)
	$(call cmd,stamp)

install-args = \
	EXTRA_CPPFLAGS='$(CPPFLAGS)' \
	EXTRA_CFLAGS='$(CFLAGS)' \
	MANDIR=$(prefix)/share/man \
	MANSUFFIX=ssl \
	INSTALL_PREFIX=$(DESTDIR) \
	DESTDIR=$(DESTDIR)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

plugin = $(prefix)/lib/ssl/engines

stripfiles = \
	$(prefix)/bin/openssl \
	$(prefix)/lib/*.so.* \
	$(plugin)/*.so

include packages/cleanup.mk
include packages/binary.mk
