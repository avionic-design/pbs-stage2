PACKAGE = ConsoleKit
VERSION = 0.3.0

LOCATION = http://people.freedesktop.org/~mccann/dist
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libck-connector.la

stripfiles = \
	$(prefix)/bin/ck-history \
	$(prefix)/bin/ck-launch-session \
	$(prefix)/bin/ck-list-sessions \
	$(prefix)/libexec/ck-collect-session-info \
	$(prefix)/libexec/ck-get-x11-display-device \
	$(prefix)/libexec/ck-get-x11-server-pid \
	$(prefix)/lib/libck-connector.so.0.0.0 \
	$(prefix)/sbin/ck-log-system-restart \
	$(prefix)/sbin/ck-log-system-start \
	$(prefix)/sbin/ck-log-system-stop \
	$(prefix)/sbin/console-kit-daemon
