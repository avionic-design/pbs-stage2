PACKAGE = ntp
VERSION = 4.2.8p10

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/$(PACKAGE)-$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--sbindir=/usr/bin \
	--with-yielding-select=yes \
	--without-ntpsnmpd

stripfiles = \
	$(prefix)/bin/ntpd \
	$(prefix)/bin/ntpdate \
	$(prefix)/bin/ntpdc \
	$(prefix)/bin/ntp-keygen \
	$(prefix)/bin/ntpq \
	$(prefix)/bin/ntptime \
	$(prefix)/bin/sntp \
	$(prefix)/bin/tickadj

prunefiles = \
	$(prefix)/bin/ntptrace \
	$(prefix)/bin/ntp-wait
