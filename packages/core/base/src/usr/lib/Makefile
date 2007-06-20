MAKEFLAGS += -rR --no-directory-output

TOP = ../../../..
GARDIR = $(TOP)
__dir = usr/lib/
ifneq ($(MAKECMDGOALS),clean)
  include $(TOP)/sys.mk
endif
include $(TOP)/meta/cross.mk
include $(TOP)/meta/defs.mk
include $(TOP)/meta/kbuild.mk

CC      := $(main_CC)
AR      := $(main_AR)
#CFLAGS  := $(main_CFLAGS) -I../include
CFLAGS := 
#LDFLAGS := $(main_LDFLAGS)

install: install-libabox.so install-libabox.a install-abioctl

libabox_SOVER = 0

define soname
$(1).so.$($(1)_SOVER)
endef

libabox_SONAME = $(call soname,libabox)
libabox_OBJS = abox-io.o
objs += $(libabox_SONAME) libabox.so $(libabox_OBJS)

$(libabox_SONAME): $(libabox_OBJS)
	$(call echo-cmd,ld_so_c)
	$(call make-cmd,ld_so_c)

libabox.a: $(libabox_OBJS)
	$(call cmd,link_l_target)

libabox.so: $(libabox_SONAME)
	$(call echo-cmd,ln_s)
	$(call make-cmd,ln_s)

$(DEVEL_PREFIX)/$(__dir)libabox.so: $(ROOTFS)/$(__dir)$(libabox_SONAME)
	$(call echo-cmd,ln_s)
	$(call make-cmd,ln_s)

$(DEVEL_PREFIX)/$(__dir)libabox.a: libabox.a
	$(call cmd,install_src)

abioctl: CFLAGS += -static -I../include
abioctl: abioctl.o libabox.a
	$(call cmd,ld_o_c)

install-libabox.a: $(DEVEL_PREFIX)/$(__dir)libabox.a
install-libabox.so: $(DEVEL_PREFIX)/$(__dir)libabox.so $(ROOTFS)/$(__dir)libabox.so $(ROOTFS)/$(__dir)$(libabox_SONAME)
install-abioctl: $(ROOTFS)/usr/bin/abioctl

__clean-files = $(libabox_ALL) $(objs) libabox.a abioctl
clean:
ifneq ($(wildcard $(__clean-files)),)
	$(call echo-cmd,clean)
	$(call make-cmd,clean)
endif

%.o: %.c
	$(call echo-cmd,cc_o_c)
	$(call make-cmd,cc_o_c)

$(ROOTFS)/$(__dir)%: %
	$(call echo-cmd,install_src)
	$(call make-cmd,install_src)

$(ROOTFS)/usr/bin/abioctl: abioctl
	$(call cmd,install_src)

