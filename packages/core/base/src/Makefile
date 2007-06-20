MAKEFLAGS += --no-print-directory

GARDIR := ../..
TOP := $(GARDIR)
ifneq ($(MAKECMDGOALS),clean)
  include $(TOP)/sys.mk
endif
include $(TOP)/meta/kbuild.mk
include $(TOP)/meta/defs.mk
include $(TOP)/meta/cross.mk

CC := $(main_CC)
CXX := $(main_CXX)
CFLAGS := $(main_CFLAGS)
CXXFLAGS := $(CFLAGS)
LDFLAGS := $(main_LDFLAGS)

dirs := \
	/ \
	/bin \
	/etc \
	/etc/default \
	/etc/init.d \
	/etc/rc6.d \
	/etc/rcS.d \
	/etc/udev \
	/etc/udev/rules.d \
	/lib \
	/lib/init \
	/lib/lsb \
	/lib/udev \
	/media \
	/mnt \
	/proc \
	/sbin \
	/sys \
	/usr \
	/usr/bin \
	/var \
	/var/log \
	/var/run \
	/tmp

files := \
	/etc/bash.bashrc \
	/etc/fstab \
	/etc/group \
	/etc/hostname \
	/etc/hosts \
	/etc/modules \
	/etc/motd \
	/etc/passwd \
	/etc/profile \
	/etc/protocols \
	/etc/services \
	/etc/default/devpts \
	/etc/default/networking \
	/etc/default/rcS \
	/etc/inittab \
	/etc/rc.local \
	/etc/init.d/hostname.sh \
	/etc/init.d/ldconfig \
	/etc/init.d/rc \
	/etc/init.d/rcS \
	/etc/init.d/makedev \
	/etc/init.d/modules \
	/etc/init.d/mount \
	/etc/init.d/networking \
	/etc/init.d/reboot \
	/etc/init.d/udev \
	/etc/udev/rules.d/udev.rules \
	/lib/init/mount-functions.sh \
	/lib/init/vars.sh \
	/lib/lsb/init-functions

libraries := \
	/usr/lib/libabox.so

symlinks := \
	/bin/cat \
	/bin/echo \
	/etc/rc6.d/S90reboot \
	/etc/rcS.d/S01mount \
	/etc/rcS.d/S02hostname.sh \
	/etc/rcS.d/S03udev \
	/etc/rcS.d/S05networking \
	/etc/rcS.d/S10makedev \
	/etc/rcS.d/S50ldconfig \
	/etc/rcS.d/S75modules \
	/etc/rcS.d/S99rc.local

binaries := \
	/sbin/start-stop-daemon \
	/usr/bin/fp \
	/usr/bin/hello \
	/usr/bin/hello++ \
	/usr/lib/abioctl

objs += \
	sbin/start-stop-daemon.o \
	usr/bin/fp.o \
	usr/bin/hello.o \
	usr/bin/hello++.o

dst-dirs := $(addprefix $(ROOTFS), $(dirs))
dst-files := $(addprefix $(ROOTFS), $(files))
dst-libraries := $(addprefix $(ROOTFS), $(libraries))
dst-binaries := $(addprefix $(ROOTFS), $(binaries))
dst-symlinks := $(addprefix $(ROOTFS), $(symlinks))

all: $(subst $(ROOTFS)/,,$(binaries))

$(dst-dirs):
	$(call echo-cmd,mkdir_p)
	$(call make-cmd,mkdir_p)

$(dst-files): $(subst $(ROOTFS)/,,$(dst-files))
	$(call echo-cmd,install)
	$(call make-cmd,install)

$(dst-libraries): $(subst $(ROOTFS)/,,$(dst-libraries))
	$(Q)cd $(dir $(subst $(ROOTFS)/,,$@)) && $(MAKE) install

$(dst-binaries): $(subst $(ROOTFS)/,,$(dst-binaries))
	$(call echo-cmd,install)
	$(call make-cmd,install)

$(dst-symlinks):
	$(call echo-cmd,symlink)
	$(call make-cmd,symlink)

__install: $(dst-dirs) $(dst-files) $(dst-libraries) $(dst-binaries) $(dst-symlinks)
install:
	$(PRIV) $(MAKE) __install

bins := $(subst $(ROOTFS)/,,$(dst-binaries))
__clean-files := $(wildcard $(objs)) $(wildcard $(bins))
__clean-dirs  :=

clean:
	$(MAKE) -C usr/lib $@
ifneq ($(strip $(__clean-files)),)
	$(call echo-cmd,clean)
	$(call make-cmd,clean)
endif
ifneq ($(strip $(__clean-dirs)),)
	$(call echo-cmd,cleandirs)
	$(call make-cmd,cleandirs)
endif

%.o: %.c
	$(call echo-cmd,cc_o_c)
	$(call make-cmd,cc_o_c)

%.o: %.cc
	$(call echo-cmd,cxx_o_c)
	$(call make-cmd,cxx_o_c)

$(subst $(ROOTFS)/,,$(dst-libraries)):
	@$(MAKE) -C $(dir $@) $(notdir $@)

sbin/start-stop-daemon: sbin/start-stop-daemon.o
	$(call echo-cmd,ld_o_c)
	$(call make-cmd,ld_o_c)

usr/bin/fp: usr/bin/fp.o
	$(call echo-cmd,ld_o_c)
	$(call make-cmd,ld_o_c)

usr/bin/hello: usr/bin/hello.o
	$(call echo-cmd,ld_o_c)
	$(call make-cmd,ld_o_c)

usr/bin/hello++: usr/bin/hello++.o
	$(call echo-cmd,ld_o_cxx)
	$(call make-cmd,ld_o_cxx)

list:
	@echo 'src/rootfs: additional initial root filesystem content'

.PHONY: list clean

