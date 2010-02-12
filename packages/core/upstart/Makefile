PACKAGE = upstart
VERSION = 0.6.5

LOCATION = http://upstart.ubuntu.com/download/0.6
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

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
