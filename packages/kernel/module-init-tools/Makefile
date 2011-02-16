PACKAGE = module-init-tools
VERSION = 3.12

LOCATION = http://www.kernel.org/pub/linux/utils/kernel/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

$(pkgtree)/.autoreconfigure:
	cd $(pkgbuildtree) && \
		$(env) autoreconf --force --install
	$(call cmd,stamp)

$(pkgtree)/.configure: $(pkgtree)/.autoreconfigure

conf-args += \
	--prefix=/ \
	--bindir=/bin

conf-args += \
	--disable-static-utils \
	--disable-docs

stripfiles = \
	/sbin/lsmod \
	/sbin/depmod \
	/sbin/insmod \
	/sbin/modinfo \
	/sbin/modprobe \
	/sbin/rmmod
