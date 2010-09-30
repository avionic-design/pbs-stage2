PACKAGE = lirc
VERSION = 0.8.7

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--with-syslog=LOG_DAEMON \
	--with-driver=userspace \
	--enable-sandboxed

conf-vars += \
	ac_cv_have_kernel=false

prunefiles = \
	$(prefix)/lib/liblirc_client.la

stripfiles = \
	$(prefix)/bin/ircat \
	$(prefix)/bin/irexec \
	$(prefix)/bin/irpty \
	$(prefix)/bin/irrecord \
	$(prefix)/bin/irsend \
	$(prefix)/bin/irw \
	$(prefix)/bin/irxevent \
	$(prefix)/bin/lircrcd \
	$(prefix)/bin/mode2 \
	$(prefix)/bin/xmode2 \
	$(prefix)/lib/liblirc_client.so.0.2.1 \
	$(prefix)/sbin/lircd \
	$(prefix)/sbin/lircmd
