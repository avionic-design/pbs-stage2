PACKAGE = upstart
VERSION = 0.6.6

MAJOR   = $(word 1,$(subst ., ,$(VERSION)))
MINOR   = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://upstart.ubuntu.com/download/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--sbindir=/sbin \
	--enable-threading \
	--disable-rpath

stripfiles = \
	/sbin/init \
	/sbin/initctl \
	/sbin/reboot \
	/sbin/runlevel \
	/sbin/shutdown \
	/sbin/telinit
