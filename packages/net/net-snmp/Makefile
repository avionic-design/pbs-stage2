PACKAGE = net-snmp
VERSION = 5.5

LOCATION = http://prdownloads.sourceforge.net/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--with-default-snmp-version=3 \
	--with-logfile=/var/log/snmpd.log \
	--with-persistent-directory=/var/run/net-snmp \
	--with-sys-contact="support@avionic-design.de" \
	--with-sys-location="Unknown"

prunefiles = \
	$(prefix)/lib/libnetsnmp.la

stripfiles = \
	$(prefix)/bin/encode_keychange \
	$(prefix)/bin/snmpbulkget \
	$(prefix)/bin/snmpbulkwalk \
	$(prefix)/bin/snmpdelta \
	$(prefix)/bin/snmpdf \
	$(prefix)/bin/snmpget \
	$(prefix)/bin/snmpgetnext \
	$(prefix)/bin/snmpnetstat \
	$(prefix)/bin/snmpset \
	$(prefix)/bin/snmpstatus \
	$(prefix)/bin/snmptable \
	$(prefix)/bin/snmptest \
	$(prefix)/bin/snmptranslate \
	$(prefix)/bin/snmptrap \
	$(prefix)/bin/snmpusm \
	$(prefix)/bin/snmpvacm \
	$(prefix)/bin/snmpwalk \
	$(prefix)/lib/libnetsnmp.so.20.0.0 \
	$(prefix)/sbin/snmpd \
	$(prefix)/sbin/snmptrapd
