PACKAGE = net-snmp
VERSION = 5.7.1

LOCATION = http://downloads.sourceforge.net/project/$(PACKAGE)/$(PACKAGE)/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools-reconf.mk

conf-args += \
	--enable-reentrant \
	--enable-ipv6 \
	--with-default-snmp-version=2 \
	--with-logfile=/var/log/snmpd.log \
	--with-persistent-directory=/var/run/net-snmp \
	--with-sys-contact="support@avionic-design.de" \
	--with-sys-location="Unknown"

conf-vars += \
	LIBS="-lpthread"

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/agentxtrap \
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
	$(prefix)/lib/*.so.* \
	$(prefix)/sbin/snmpd \
	$(prefix)/sbin/snmptrapd
