PACKAGE = codec-engine
VERSION = 2.25.05.16

TI_VERSION   = $(subst .,_,$(VERSION))
TI_PACKAGE   = $(subst -,_,$(PACKAGE))
TI_SHORT_PKG = ce

LOCATION = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/2_25_05_16/exports
TARBALLS = $(TI_PACKAGE)_$(TI_VERSION),lite.tar.gz

include packages/ti/ti.mk

$(pkgtree)/.build: $(pkgbuildtree)/packages/ti/sdo/ce/ce_version.c

$(pkgbuildtree)/packages/ti/sdo/ce/ce_version.c: $(srctree)/packages/ti/$(PACKAGE)/ce_version.c
	cp $< $(@D)
