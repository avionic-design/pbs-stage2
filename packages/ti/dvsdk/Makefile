PACKAGE = dvsdk
VERSION = 3.10.00.16

MAJOR   = $(word 1,$(subst ., ,$(VERSION)))
MINOR   = $(word 2,$(subst ., ,$(VERSION)))

TI_VERSION = $(subst .,_,$(VERSION))
TI_PKG = $(shell echo $(PACKAGE) | tr a-z A-Z)_$(MAJOR)_$(MINOR)

LOCATION = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/$(PACKAGE)/$(TI_PKG)/latest/exports
TARBALLS = $(PACKAGE)_$(TI_VERSION)_Setup.bin

run_bin_PROG = $(srctree)/packages/ti/dvsdk/unpack_dvsdk
run_bin_ARGS = $<

include packages/ti/ti.mk

packages-$(CONFIG_PACKAGE_TI_DM365_MMAP)   += dm365mm
packages-$(CONFIG_PACKAGE_TI_DM365_CODECS) += dm365-codecs
