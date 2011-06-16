include packages/libs/dbus/Makefile.location
include packages/autotools.mk

conf-args += \
	--libexec=$(prefix)/lib/dbus-1.0 \
	--with-root=$(SYSROOT)

ifeq ($(CONFIG_PACKAGE_LIBS_DBUS_X11),y)
  conf-args += --with-x
else
  conf-args += --without-x
endif

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

conf-vars += \
	ac_cv_have_abstract_sockets=yes

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/dbus-cleanup-sockets \
	$(prefix)/bin/dbus-daemon \
	$(prefix)/bin/dbus-launch \
	$(prefix)/bin/dbus-monitor \
	$(prefix)/bin/dbus-send \
	$(prefix)/bin/dbus-uuidgen \
	$(prefix)/lib/*.so.* \
	$(prefix)/lib/dbus-1.0/dbus-daemon-launch-helper
