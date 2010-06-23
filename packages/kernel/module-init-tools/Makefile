PACKAGE = module-init-tools
VERSION = 3.12

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/sbin/insmod.static

stripfiles = \
	$(prefix)/bin/lsmod \
	$(prefix)/sbin/depmod \
	$(prefix)/sbin/insmod \
	$(prefix)/sbin/modinfo \
	$(prefix)/sbin/modprobe \
	$(prefix)/sbin/rmmod
