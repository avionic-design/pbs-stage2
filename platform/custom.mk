ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
  include platform/toolchain/$(TOOLCHAIN)/Makefile
endif

CC ?= $(CROSS_COMPILE)gcc

quiet_cmd_build = CC        $(subst $(PLATFORM)/src/rootfs,,$@)
      cmd_build = $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<

quiet_cmd_clean = CLEAN     $(subst $(PLATFORM)/src/rootfs,,$*)
      cmd_clean = rm -f $*

quiet_cmd_install = INSTALL   $(subst $(ROOTFS),,$@)
      cmd_install = $(priv) install $(subst $(ROOTFS),$(PLATFORM)/src/rootfs,$@) $@

quiet_cmd_install_bin = INSTALL   $(subst $(ROOTFS),,$@)
      cmd_install_bin = $(priv) install --mode 755 $(subst $(ROOTFS),$(PLATFORM)/src/rootfs,$@) $@

quiet_cmd_link = LN        $(subst $(ROOTFS),,$3) -> $2
      cmd_link = $(priv) ln -sf $2 $3

quiet_cmd_relink = LN        $* -> $(shell readlink $<)
      cmd_relink = $(priv) ln -sf $(shell readlink $<) $@

src-progs	= $(addprefix $(PLATFORM)/src/rootfs, $(progs))
clean-progs	= $(addprefix clean-, $(wildcard $(src-progs)))
rootfs-dirs	= $(addprefix $(ROOTFS), $(dirs))
rootfs-files	= $(addprefix $(ROOTFS), $(files))
rootfs-links	= $(addprefix $(ROOTFS), $(links))
rootfs-progs	= $(addprefix $(ROOTFS), $(progs))
rootfs-scripts	= $(addprefix $(ROOTFS), $(scripts))

$(src-progs): $(srctree)/%: $(srctree)/%.c
	$(call cmd,build)

$(clean-progs): clean-%:
	$(call cmd,clean)

rootfs-build: $(src-progs)
	@:

rootfs-install: rootfs-build $(rootfs-dirs) $(rootfs-files) $(rootfs-links) \
			$(rootfs-progs) $(rootfs-scripts)
	$(call cmd,link,/sbin/init,$(ROOTFS)/init)

rootfs-clean: $(clean-progs)
	@:

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

$(rootfs-files): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,install)

$(rootfs-links): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,relink)

$(rootfs-progs): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,install_bin)

$(rootfs-scripts): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,install_bin)


