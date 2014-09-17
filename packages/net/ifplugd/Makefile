PACKAGE = ifplugd
VERSION = 0.28

LOCATION = http://0pointer.de/lennart/projects/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-initdir=/etc/init.d \
	--disable-lynx

stripfiles = \
	$(prefix)/sbin/ifplugd \
	$(prefix)/sbin/ifplugstatus
