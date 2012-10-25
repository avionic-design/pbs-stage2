src := $(obj)

uid:=$(shell id -u)
ifneq ($(uid),0)
$(error This makefile must be run as (fake)root!)
endif

PHONY := all
all: finish

include include/config/auto.conf
include include/config/depends-dirs.mk
include $(srctree)/scripts/Kbuild.include
include $(srctree)/scripts/Makefile.lib

CONFIG_ARCH := $(subst $(quote),,$(CONFIG_ARCH))
include $(if $(KBUILD_SRC),$(srctree)/arch/$(CONFIG_ARCH)/Makefile)


# Get the current version of the packages in dir $(1)
get-version       = $(shell $(MAKE) $(package)=$(1) quiet=silent_ print 2> /dev/null | sed 's,^[^:]*: *,,')
get-name          = $(shell $(MAKE) $(package)=$(1) quiet=silent_ print 2> /dev/null | sed 's,:.*,,')

#
# Parameters
#

# Platform name
rootfs-platform  ?= $(master-platform)
rootfs-name      ?= $(if $(rootfs-platform),$(call get-name,$(rootfs-platform)),rootfs)
# Platform version
rootfs-version   ?= $(if $(rootfs-platform),$(call get-version,$(rootfs-platform)))
# Type of rootfs to create
rootfs-type      ?= tar.gz
# Where to create the rootfs
rootfs-dir       ?= $(obj)/rootfs
rootfs-root       = $(rootfs-dir)$(if $(rootfs-prefix),/$(rootfs-prefix))
# Filename of the rootfs image
rootfs-file      ?= $(rootfs-name)$(if $(rootfs-version),_$(rootfs-version)).$(rootfs-type)
rootfs-img       ?= $(dir $(rootfs-dir))$(rootfs-file)
# Default type of packages to use
packages-type    ?= tar.bz2
# The list of packages to install
# packages    ?= <generated list>

#
# Look if the platform define a configuration
#
ifneq ($(rootfs-platform),)
ifneq ($(wildcard $(srctree)/$(rootfs-platform)/make-fs.mk),)
include $(srctree)/$(rootfs-platform)/make-fs.mk
ifneq ($(packages)$(packages-y),)
packages := $(packages) $(packages-y)
endif
endif
endif


#
# Auto generate the packages list, if we have none, and get the filename of each package.
#
ifeq ($(packages),)
packages-filter  ?= linux-headers %-dev %-doc %-l10n %-locale %-man
packages-dirs    ?= $(depends-dirs)

# List the basename of all package available from directory $(1)
get-basenames     = $(patsubst $(srctree)/$(1)/%.install,%,$(wildcard $(srctree)/$(1)/*.install))
# List the full name of the packages to extract from directory $(1)
get-names         = $(addprefix $(1)/,$(filter-out $(packages-filter),$(call get-basenames,$(1))))
# Get the filenames of the packages from directory $(1)
get-filenames     = $(addsuffix _$(call get-version,$(1))_$(TARGET).$(packages-type),$(call get-names,$(1)))

packages         := $(foreach dir,$(packages-dirs),$(call get-names,$(dir)))
filenames        := $(foreach dir,$(packages-dirs),$(call get-filenames,$(dir)))
else
# Get the filename of package $(1)
get-filename      = $(addsuffix _$(call get-version,$(dir $(1)))_$(TARGET).$(packages-type),$(1))

filenames        := $(foreach pkg,$(packages),$(call get-filename,$(pkg)))
endif

#
# Extra pre/post processing rules
#

# Run depmod if linux-modules get installed
ifneq ($(filter packages/kernel/linux/linux-modules,$(packages)),)
postprocess: depmod
# This is not very nice, but it might not be possible to do better.
include $(objtree)/build/packages/kernel/linux/kernel-version
depmod: KERNEL_VERSION := $(VERSION)
endif

# Create a machine id for dbus
ifneq ($(filter packages/libs/dbus/libdbus-bin,$(packages)),)
postprocess: $(rootfs-root)/var/lib/dbus/machine-id
endif

#
# Default rules
#

extract := $(addprefix extract-,$(filenames))

# This dependency is there to make sure that all requiered packages are present
# before we start doing anything.
PHONY += check-packages
check-packages: $(addprefix $(objtree)/binary/,$(filenames))

PHONY += mkdir
mkdir: check-packages
	$(call cmd,mkdir_rootfs)

PHONY += mount-ramdisk
mount-ramdisk: mkdir
	$(call cmd,mount_ramdisk)

$(rootfs-dir): mkdir

PHONY += begin-preprocess
begin-preprocess: mount-ramdisk

PHONY += preprocess
preprocess: begin-preprocess

PHONY += extract
extract: preprocess $(extract)

PHONY += $(extract)
$(extract): extract-%: $(objtree)/binary/% preprocess
	$(call cmd,extract_$(packages-type))

PHONY += begin-postprocess
begin-postprocess: extract

PHONY += postprocess
postprocess: begin-postprocess

PHONY += make-image
make-image: $(rootfs-img) postprocess

$(rootfs-img): $(rootfs-dir) postprocess
	$(call cmd,mkimg_$(rootfs-type))

PHONY += umount-ramdisk
umount-ramdisk: make-image
	$(call cmd,umount_ramdisk)

PHONY += finish
finish: umount-ramdisk

#
# Preprocessing rules
#

# none atm

#
# Postprocessing rules
#

PHONY += depmod
depmod: begin-postprocess
	$(call cmd,depmod)

$(rootfs-root)/var/lib/dbus/machine-id: begin-postprocess
	$(call cmd,mkmachine_id)

#
# Commands
#
quiet_cmd_mkdir_rootfs = MKDIR   $(rootfs-root)
      cmd_mkdir_rootfs = rm -rf $(rootfs-dir) $(rootfs-img) && mkdir -p $(rootfs-root)

quiet_cmd_extract_tar.bz2 = TAR [x] $*
      cmd_extract_tar.bz2 = tar --bzip2 -x -f $< -C $(rootfs-root) --exclude ./DEBIAN

quiet_cmd_depmod = DEPMOD  $(KERNEL_VERSION)
      cmd_depmod = /sbin/depmod -b $(rootfs-root) $(KERNEL_VERSION)

quiet_cmd_mkimg_tar.gz = TAR [c] $@
      cmd_mkimg_tar.gz = tar -c -C $< --gzip -f $@ .

quiet_cmd_mkimg_tar.bz2 = TAR [c] $@
      cmd_mkimg_tar.bz2 = tar -c -C $< --bzip2 -f $@ .

quiet_cmd_mkimg_initrd.gz = CPIO $@
      cmd_mkimg_initrd.gz = cd $< && find | cpio -H newc --quiet -o | gzip -c > $@

quiet_cmd_mkimg_squashfs = SQUASHFS $@
      cmd_mkimg_squashfs = mksquashfs $< $@ -noappend

quiet_cmd_mkmachine_id = GEN     $@
      cmd_mkmachine_id = cat /proc/sys/kernel/random/uuid | md5sum | cut -d ' ' -f 1 > $@

# Optional commands to build the image in a tmpfs
ifeq ($(ROOTFS_MOUNT_TMPFS),y)
quiet_cmd_mount_ramdisk = MOUNT   $(rootfs-root)
      cmd_mount_ramdisk = mount -t tmpfs none $(rootfs-root)

quiet_cmd_umount_ramdisk = UMOUNT  $(rootfs-root)
      cmd_umount_ramdisk = umount $(rootfs-root)
endif

#
# Check the configurable parameters
#
ifeq ($(cmd_mkimg_$(rootfs-type)),)
$(error $(rootfs-type) rootfs is not (yet?) supported)
endif

ifeq ($(cmd_extract_$(packages-type)),)
$(error Installing the $(packages-type) packages is not (yet?) supported)
endif

#
# Install ordering
#

# Function to reverse a list
reverse = $(if $(wordlist 2,$(words $(1)),$(1)),$(call reverse,$(wordlist 2,$(words $(1)),$(1))) )$(firstword $(1))

# Create an order dependency from the given list
define add-order-deps
$(firstword $(1)): $(word 2,$(1))
$(if $(wordlist 2,$(words $(1)),$(1)),$(call add-order-deps,$(wordlist 2,$(words $(1)),$(1))))
endef

# Make sure the packages are installed in the correct order.
$(eval $(call add-order-deps,$(call reverse,$(extract))))

# vim: ft=make
