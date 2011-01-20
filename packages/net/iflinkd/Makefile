PACKAGE = iflinkd
VERSION = 0.1.2

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args-$(CONFIG_PACKAGE_CORE_SYSTEMD) += \
	--with-systemdsystemunitdir=/etc/systemd/system

conf-args += \
	$(conf-args-y)

stripfiles = \
	$(prefix)/sbin/iflinkd
