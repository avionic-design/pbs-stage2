include packages/kernel/kmod/Makefile.location
include packages/build-tools/autotools.mk

conf-args += \
	--disable-manpages \
	--without-bashcompletiondir

quiet_cmd_symlink = SYMLINK $@
      cmd_symlink = ln -s $(<F) $@

$(prefix)/bin/depmod: $(prefix)/bin/kmod
	$(call cmd,symlink)

$(pkgtree)/.binary: $(prefix)/bin/depmod

prunefiles = \
	$(prefix)/lib/libkmod.la
