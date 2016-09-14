PACKAGE = rum
VERSION = 1.0.0

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/$(PACKAGE) \
	--with-libsensors=$(SYSROOT)/$(prefix) \
	--disable-werror

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

stripfiles = \
	$(prefix)/sbin/rumd
