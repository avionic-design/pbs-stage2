PACKAGE = dbus-glib
VERSION = 0.82

LOCATION = http://dbus.freedesktop.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-vars += \
	ac_cv_func_posix_getpwnam_r=yes \
	ac_cv_have_abstract_sockets=yes

prunefiles = \
	$(prefix)/lib/libdbus-glib-1.la

stripfiles = \
	$(prefix)/bin/dbus-binding-tool \
	$(prefix)/lib/libdbus-glib-1.so.2.1.0 \
	$(prefix)/libexec/dbus-bash-completion-helper
