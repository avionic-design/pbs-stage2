# select toolchain
#TOOLCHAIN = arm-linux
#ifneq ($(wildcard platform/toolchain/$(TOOLCHAIN)/Makefile),)
#  include platform/toolchain/$(TOOLCHAIN)/Makefile
#endif

CROSS_COMPILE = /home/thierry/toolchain/usr/bin/arm-xscale-linux-uclibc-
export CROSS_COMPILE

packages-y = \
	initrd/busybox \
	initrd/dash

PHONY += platform-clean
platform-clean: __clean-dirs = $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)

