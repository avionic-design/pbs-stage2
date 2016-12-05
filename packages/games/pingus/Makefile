PACKAGE = pingus
VERSION = 0.7.6
LICENSE = GPLv3

LOCATION = https://github.com/Pingus/pingus/archive
TARBALLS = v$(VERSION).tar.gz;filename=$(PACKAGE)-$(VERSION).tar.gz

include packages/common.mk

$(pkgtree)/.setup: $(pkgtree)/.patch
	$(call cmd,stamp)

scons-args += \
	with_opengl=False \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CFLAGS="$(CFLAGS)" \
	CXXFLAGS="$(CXXFLAGS)" \
	LINKFLAGS="$(LDFLAGS)" \
	CPPPATH="$(SYSROOT)$(prefix)/include" \
	LIBPATH="$(SYSROOT)/lib" \
	CPPDEFINES="BOOST_SIGNALS_NO_DEPRECATION_WARNING" \
	PKG_CONFIG_LIBDIR="$(PKG_CONFIG_LIBDIR)"

$(pkgtree)/.build:  $(pkgtree)/.patch
	cd $(pkgbuildtree) && \
		mkdir -p build && \
		$(env) scons -j $(NUM_CPU) $(scons-args) src && \
		$(env) scons -j $(NUM_CPU) $(scons-args) && \
		touch build/pingus
	$(call cmd,stamp)

install-args = \
	DESTDIR=$(DESTDIR) \
	PREFIX=$(prefix)

$(pkgtree)/.do-install: $(pkgtree)/.build
	cd $(pkgbuildtree) && \
		$(env) $(priv) $(MAKE) $(install-args) install
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/bin/pingus.bin

include packages/cleanup.mk
include packages/binary.mk
