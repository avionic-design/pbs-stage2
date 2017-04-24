PACKAGE = weston
VERSION = 2.0.0
LICENSE = custom

LOCATION = http://wayland.freedesktop.org/releases
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools-reconf.mk

conf-vars += \
	WAYLAND_PROTOCOLS_SYSROOT_DIR=$(SYSROOT)

conf-args += \
	--libexecdir=$(prefix)/lib/$(PACKAGE)

prunefiles = \
	$(prefix)/lib/$(PACKAGE)/*.la

stripfiles = \
	$(prefix)/bin/wcap-decode \
	$(prefix)/bin/weston \
	$(prefix)/bin/weston-info \
	$(prefix)/bin/weston-launch \
	$(prefix)/bin/weston-terminal \
	$(prefix)/lib/$(PACKAGE)/*.so \
	$(prefix)/lib/$(PACKAGE)/weston-desktop-shell \
	$(prefix)/lib/$(PACKAGE)/weston-screenshooter \
	$(prefix)/lib/$(PACKAGE)/weston-tablet-shell
