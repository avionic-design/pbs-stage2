PACKAGE = pkg-config
VERSION = 0.29
LICENSE = GPL

LOCATION = http://pkgconfig.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/build-tools/autotools.mk

conf-args += \
	--with-internal-glib

quiet_cmd_m4_gen = GEN     $(@F)
      cmd_m4_gen = mkdir -p $(@D) && m4 -P -DBUILD_TOOLS=$(prefix) $< > $@ && \
			chmod 0755 $@ || (rm -f $@ ; false)

$(prefix)/bin/pkg-config-build: $(pkgsrctree)/pkg-config-build.m4
	$(call cmd,m4_gen)

$(pkgtree)/.do-install: $(prefix)/bin/pkg-config-build
