include packages/kernel/kmod/Makefile.location
include packages/build-tools/autotools.mk

quiet_cmd_symlink = SYMLINK $@
      cmd_symlink = ln -s $(<F) $@

$(prefix)/bin/depmod: $(prefix)/bin/kmod
	$(call cmd,symlink)

$(pkgtree)/.binary: $(prefix)/bin/depmod
