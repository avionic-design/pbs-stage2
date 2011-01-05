PACKAGE = ConsoleKit
VERSION = 0.4.3

LOCATION = http://www.freedesktop.org/software/$(PACKAGE)/dist
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

conf-args += \
	--libexecdir=$(prefix)/lib/$(PACKAGE)

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

prunefiles = \
	$(prefix)/lib/libck-connector.la

stripfiles = \
	$(prefix)/bin/ck-history \
	$(prefix)/bin/ck-launch-session \
	$(prefix)/bin/ck-list-sessions \
	$(prefix)/lib/$(PACKAGE)/ck-collect-session-info \
	$(prefix)/lib/$(PACKAGE)/ck-get-x11-display-device \
	$(prefix)/lib/$(PACKAGE)/ck-get-x11-server-pid \
	$(prefix)/lib/libck-connector.so.0.0.0 \
	$(prefix)/sbin/ck-log-system-restart \
	$(prefix)/sbin/ck-log-system-start \
	$(prefix)/sbin/ck-log-system-stop \
	$(prefix)/sbin/console-kit-daemon
