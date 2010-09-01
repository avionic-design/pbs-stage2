PACKAGE = xdctools
VERSION = 3.20.02.59

TI_VERSION = $(subst .,_,$(VERSION))

LOCATION = http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/$(TI_VERSION)/exports/
TARBALLS = xdctools_setuplinux_$(TI_VERSION).bin

run_bin_ARGS = --prefix $(pkgtree) -Y --mode silent

include packages/ti/ti.mk
