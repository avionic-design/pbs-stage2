include packages/toolchain/gcc/Makefile.location

PACKAGE = gcc-libs
LOCATION :=
TARBALLS :=

include packages/common.mk

CC = $(CROSS_COMPILE)gcc

srcdir = $(abspath $(dir $(shell $(env) $(CC) -print-file-name=libgcc_s.so)))

$(pkgtree)/.setup:
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.patch
	$(call cmd,stamp)

$(pkgtree)/.build: $(pkgtree)/.configure
	$(call cmd,stamp)

$(pkgtree)/.do-install: $(pkgtree)/.build
	install -m 755 -d $(DESTDIR)$(prefix)/lib
	# libgcc
	cp -dp $(srcdir)/libgcc_s.so.1 $(DESTDIR)$(prefix)/lib
	#ln -sf libgcc_s.so.1 $(DESTDIR)$(prefix)/lib/libgcc_s.so
	cp -dp $(srcdir)/libgcc_s.so $(DESTDIR)$(prefix)/lib
	cp -dp $(srcdir)/gcc/$(TARGET)/$(VERSION)/libgcc.a $(DESTDIR)$(prefix)/lib
	# libssp (uncomment when GCC supports SSP properly)
	#cp -dp $(srcdir)/libssp.so.0.0.0 $(DESTDIR)$(prefix)/lib
	#ln -sf libssp.so.0.0.0 $(DESTDIR)$(prefix)/lib/libssp.so.0
	#ln -sf libssp.so.0 $(DESTDIR)$(prefix)/lib/libssp.so
	#cp -dp $(srcdir)/libssp.a $(DESTDIR)$(prefix)/lib
	# libstdc++
	cp -dp $(srcdir)/libstdc++.so.6.0.16 $(DESTDIR)$(prefix)/lib
	ln -sf libstdc++.so.6.0.16 $(DESTDIR)$(prefix)/lib/libstdc++.so.6
	ln -sf libstdc++.so.6 $(DESTDIR)$(prefix)/lib/libstdc++.so
	cp -dp $(srcdir)/libstdc++.a $(DESTDIR)$(prefix)/lib
	$(call cmd,stamp)

stripfiles = \
	$(prefix)/lib/*.so.*

include packages/cleanup.mk
include packages/binary.mk
