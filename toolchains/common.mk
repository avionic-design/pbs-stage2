SYSROOT	= $(CURDIR)
prefix	= /usr
variant	= sysroot
export SYSROOT prefix variant

clean-dirs  := build include scripts
clean-files := .config.old .depends source Makefile
clean-files += kernel-release kernel-version

mrproper-dirs  :=
mrproper-files :=

distclean-dirs  := usr
distclean-files :=
