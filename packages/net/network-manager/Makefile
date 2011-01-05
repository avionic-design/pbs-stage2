PACKAGE = NetworkManager
VERSION = 0.8.2

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://ftp.gnome.org/pub/GNOME/sources/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/autotools.mk

pkglib = $(prefix)/lib/$(PACKAGE)

conf-args += \
	--with-keyfiledir=/var/lib/NetworkManager/system-connections \
	--with-dhclient=/usr/sbin/dhclient \
	--libexec=$(pkglib) \
	--with-distro=debian \
	--with-crypto=gnutls

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

prunefiles = \
	$(prefix)/lib/*.la \
	$(pkglib)/*.a \
	$(pkglib)/*.la

stripfiles = \
	$(prefix)/bin/nmcli \
	$(prefix)/bin/nm-tool \
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/NetworkManager \
	$(pkglib)/nm-avahi-autoipd.action \
	$(pkglib)/nm-crash-logger \
	$(pkglib)/nm-dhcp-client.action \
	$(pkglib)/nm-dispatcher.action \
	$(pkglib)/*.so
