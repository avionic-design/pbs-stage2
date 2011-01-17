include packages/libs/libnih/Makefile.location
include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libnih.la \
	$(prefix)/lib/libnih-dbus.la

stripfiles = \
	$(prefix)/bin/nih-dbus-tool \
	$(prefix)/lib/libnih.so.1.0.0 \
	$(prefix)/lib/libnih-dbus.so.1.0.0

# Fixes needed when building against the internal libintl.
# That should be only enabled when libintl is not present.
# For now we assume that libintl is built as part of glibc.
ifneq ($(CONFIG_GLIBC),y)
# Fix the include path to allow including the generated libintl.h.
# Bug should be fixed in autoconf/make.
CFLAGS += -I../intl
# Install the generated libintl.h as it is referenced by some other
# intalled headers.
# Bug should be fixed in libnih.
$(pkgtree)/.do-install: $(DESTDIR)/$(prefix)/include/libintl.h
$(DESTDIR)/$(prefix)/include/libintl.h: $(pkgbuildtree)/obj-$(HOST_GNU_TYPE)/intl/libintl.h
	$(call cmd,install)

endif
