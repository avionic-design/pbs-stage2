include scripts/pbuild.mk

pbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
include $(if $(wildcard $(pbuild-dir)/pbuild), $(pbuild-dir)/pbuild, $(pbuild-dir)/Makefile)
include scripts/Makefile.lib

quiet_cmd_install = INSTALL   $(subst $(ROOTFS),,$@)
      cmd_install = $(priv) install $(subst $(ROOTFS),$(PLATFORM)/src/rootfs,$@) $@

dirs = \
	/etc/init.d \
	/lib/lsb

files = \
	/etc/group \
	/etc/init.d/rcS \
	/etc/passwd \
	/lib/lsb/init-functions

rootfs-dirs  = $(addprefix $(ROOTFS), $(dirs))
rootfs-files = $(addprefix $(ROOTFS), $(files))

rootfs-install: $(rootfs-dirs) $(rootfs-files)
	$(priv) ln -sf /sbin/init $(ROOTFS)/init

$(rootfs-dirs):
	$(call cmd,priv_mkdir_p)

$(rootfs-files):
	$(call cmd,install)

