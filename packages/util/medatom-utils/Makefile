PACKAGE = medatom-utils
VERSION = 0.4.0

LOCATION = http://ftp.avionic-design.de/pub/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.xz

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/$(PACKAGE)

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
  conf-args += --with-systemdsystemunitdir=$(prefix)/lib/systemd/system
endif

stripfiles = \
	$(prefix)/sbin/medatom-bios-mac
