PACKAGE = lldpd
VERSION = 0.5.2

LOCATION = http://www.luffy.cx/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-snmp

ifeq ($(CONFIG_PACKAGE_CORE_SYSTEMD),y)
conf-args += \
	--with-systemdsystemunitdir=/etc/systemd/system
endif

conf-vars += \
	ac_cv_path_NETSNMP_CONFIG=$(SYSROOT)$(prefix)/bin/net-snmp-config \
	ac_cv_cflags_gcc_option__fstack_protector=no

stripfiles = \
	$(prefix)/sbin/lldpctl \
	$(prefix)/sbin/lldpd
