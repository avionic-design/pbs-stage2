PACKAGE = lldpd
VERSION = 0.5.2
LICENSE = ISC

LOCATION = http://media.luffy.cx/files/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args-$(CONFIG_PACKAGE_NET_LLDPD_SNMP) += --with-snmp
conf-args-$(CONFIG_PACKAGE_NET_LLDPD_XML) += --with-xml
conf-args-$(CONFIG_PACKAGE_CORE_SYSTEMD) += \
	--with-systemdsystemunitdir=/etc/systemd/system

conf-args += $(conf-args-y)
conf-vars += \
	ac_cv_cflags_gcc_option__fstack_protector=no

stripfiles = \
	$(prefix)/sbin/lldpctl \
	$(prefix)/sbin/lldpd
