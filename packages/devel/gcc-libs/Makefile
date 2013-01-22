PACKAGE = gcc-libs
VERSION = $(shell $(env) $(CC) -dumpversion)
LICENSE = GPL LGPL

include $(srctree)/autoconf.mk
include packages/common.mk

soname = $(basename $(basename $(1)))

CC = $(CROSS_COMPILE)gcc

srcdir = $(dir $(realpath $(shell $(env) $(CC) -print-file-name=libgcc_s.so)))
sysroot = $(shell $(env) $(CC) -print-sysroot)

libgcc = $(abspath $(shell $(env) $(CC) -print-file-name=libgcc_s.so))
libgcc-target = $(realpath $(libgcc))

ifeq ($(libgcc),$(libgcc-target))
  libgcc-soname = $(shell $(AWK) '/GROUP/ { print $$3 }' $(libgcc))
else
  libgcc-soname = $(notdir $(libgcc-target))
endif

libssp = $(realpath $(shell $(env) $(CC) -print-file-name=libssp.so))
libssp-soname = $(notdir $(call soname,$(libssp)))

libstdcxx = $(realpath $(shell $(env) $(CC) -print-file-name=libstdc++.so))
libstdcxx-soname = $(notdir $(call soname,$(libstdcxx)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

#
# commands
#
quiet_cmd_copydir = COPY    $@
      cmd_copydir = cp -a $< $@

quiet_cmd_copy = COPY    $@
      cmd_copy = cp -dp $< $@

quiet_cmd_symlink = SYMLINK $@
      cmd_symlink = ln -sf $(<F) $@

#
# directories
#
$(DESTDIR)$(prefix)/include/c++:
	$(call cmd,mkdir_p)

$(DESTDIR)$(prefix)/include/c++/$(VERSION): $(sysroot)/usr/include/c++/$(VERSION) | $(DESTDIR)$(prefix)/include/c++
	$(call cmd,copydir)

$(DESTDIR)$(prefix)/lib:
	$(call cmd,mkdir_p)

dirs = \
	$(DESTDIR)$(prefix)/include/c++/$(VERSION) \
	$(DESTDIR)$(prefix)/lib

#
# libgcc
#
$(DESTDIR)$(prefix)/lib/$(libgcc-soname): $(srcdir)$(libgcc-soname)
	$(call cmd,copy)

$(DESTDIR)$(prefix)/lib/libgcc_s.so: $(srcdir)libgcc_s.so
	$(call cmd,copy)

$(DESTDIR)$(prefix)/lib/libgcc.a: $(srcdir)gcc/$(TARGET)/$(VERSION)/libgcc.a
	$(call cmd,copy)

files = \
	$(DESTDIR)$(prefix)/lib/$(libgcc-soname) \
	$(DESTDIR)$(prefix)/lib/libgcc_s.so \
	$(DESTDIR)$(prefix)/lib/libgcc.a

#
# libssp
#
ifneq ($(wildcard $(libssp)),)
$(DESTDIR)$(prefix)/lib/$(notdir $(libssp)): $(libssp)
	$(call cmd,copy)

$(DESTDIR)$(prefix)/lib/$(libssp-soname): $(DESTDIR)$(prefix)/lib/$(notdir $(libssp))
	$(call cmd,symlink)

$(DESTDIR)$(prefix)/lib/libssp.so: $(DESTDIR)$(prefix)/lib/$(libssp-soname)
	$(call cmd,symlink)

$(DESTDIR)$(prefix)/lib/libssp.a: $(srcdir)libssp.a
	$(call cmd,copy)

files += \
	$(DESTDIR)$(prefix)/lib/$(notdir $(libssp)) \
	$(DESTDIR)$(prefix)/lib/$(libssp-soname) \
	$(DESTDIR)$(prefix)/lib/libssp.so \
	$(DESTDIR)$(prefix)/lib/libssp.a
endif

#
# libstdc++
#
$(DESTDIR)$(prefix)/lib/$(notdir $(libstdcxx)): $(libstdcxx)
	$(call cmd,copy)

$(DESTDIR)$(prefix)/lib/$(libstdcxx-soname): $(DESTDIR)$(prefix)/lib/$(notdir $(libstdcxx))
	$(call cmd,symlink)

$(DESTDIR)$(prefix)/lib/libstdc++.so: $(DESTDIR)$(prefix)/lib/$(libstdcxx-soname)
	$(call cmd,symlink)

$(DESTDIR)$(prefix)/lib/libstdc++.a: $(srcdir)libstdc++.a
	$(call cmd,copy)

files += \
	$(DESTDIR)$(prefix)/lib/$(notdir $(libstdcxx)) \
	$(DESTDIR)$(prefix)/lib/$(libstdcxx-soname) \
	$(DESTDIR)$(prefix)/lib/libstdc++.so \
	$(DESTDIR)$(prefix)/lib/libstdc++.a

$(pkgtree)/.do-install: $(pkgtree)/.build $(dirs) $(files)
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
