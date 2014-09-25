include packages/libs/dbus/Makefile.common

ifeq ($(CONFIG_PACKAGE_LIBS_DBUS_X11),y)
  conf-args += --with-x
else
  conf-args += --without-x
endif

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif
