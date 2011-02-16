PACKAGE = ifplugd
VERSION = 0.28

LOCATION = http://0pointer.de/lennart/projects/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars-$(CONFIG_PACKAGE_DEVEL_GLIBC) = \
	ac_cv_func_malloc_0_nonnull=yes

conf-args += \
	--with-initdir=/etc/init.d \
	--disable-lynx

conf-vars += \
	$(conf-vars-y)

stripfiles = \
	$(prefix)/sbin/ifplugd \
	$(prefix)/sbin/ifplugstatus
