PACKAGE = module-init-tools
VERSION = 3.12

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--prefix=/ \
	--bindir=/bin

prunefiles = \
	/sbin/insmod.static

stripfiles = \
	/sbin/lsmod \
	/sbin/depmod \
	/sbin/insmod \
	/sbin/modinfo \
	/sbin/modprobe \
	/sbin/rmmod
