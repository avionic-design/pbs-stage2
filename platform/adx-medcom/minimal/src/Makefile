include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild),$(pbuild-dir)/pbuild,$(pbuild-dir)/Makefile)
include scripts/Makefile.lib

quiet_cmd_install = INSTALL   $(subst $(ROOTFS),,$@)
      cmd_install = $(priv) install $(subst $(ROOTFS),$(PLATFORM)/src/rootfs,$@) $@

quiet_cmd_install_bin = INSTALL   $(subst $(ROOTFS),,$@)
      cmd_install_bin = $(priv) install --mode 755 $(subst $(ROOTFS),$(PLATFORM)/src/rootfs,$@) $@

quiet_cmd_relink = LN        $*
      cmd_relink = $(priv) ln -sf $(shell readlink $<) $@

dirs = \
	/etc/init.d \
	/lib/lsb \
	/var/lock \
	/var/log

files = \
	/etc/group \
	/etc/init.d/rcS \
	/etc/init.d/syslogd \
	/etc/passwd \
	/lib/lsb/init-functions

links = \
	/etc/rcS.d/S10syslogd

bin =

rootfs-dirs  = $(addprefix $(ROOTFS), $(dirs))
rootfs-files = $(addprefix $(ROOTFS), $(files))
rootfs-links = $(addprefix $(ROOTFS), $(links))
rootfs-bin   = $(addprefix $(ROOTFS), $(bin))

rootfs-build:
rootfs-build:
rootfs-build:
	@:

rootfs-install: rootfs-build $(rootfs-dirs) $(rootfs-files) $(rootfs-links) $(rootfs-bin)
	$(priv) ln -sf /sbin/init $(ROOTFS)/init

rootfs-clean:
	@:

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

$(rootfs-files): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,install)

$(rootfs-links): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,relink)

$(rootfs-bin): $(ROOTFS)%: $(PLATFORM)/src/rootfs/%
	$(call cmd,install_bin)

