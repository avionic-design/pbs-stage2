PACKAGE = upstart
VERSION = 1.13.2

LOCATION = http://upstart.ubuntu.com/download/$(VERSION)
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
