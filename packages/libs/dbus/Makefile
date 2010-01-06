PACKAGE = dbus
VERSION = 1.3.0

LOCATION = http://dbus.freedesktop.org/releases/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

ifeq ($(CONFIG_PACKAGE_LIBS_DBUS_X11),y)
  conf-args += --with-x
else
  conf-args += --without-x
endif

conf-vars += \
	ac_cv_have_abstract_sockets=yes

prunefiles = \
	$(prefix)/lib/libdbus-1.la

stripfiles = \
	$(prefix)/bin/dbus-cleanup-sockets \
	$(prefix)/bin/dbus-daemon \
	$(prefix)/bin/dbus-launch \
	$(prefix)/bin/dbus-monitor \
	$(prefix)/bin/dbus-send \
	$(prefix)/bin/dbus-uuidgen \
	$(prefix)/lib/libdbus-1.so.3.5.0
