PACKAGE = ntp
VERSION = 4.2.6p5

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = http://archive.ntp.org/ntp4/$(PACKAGE)-$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
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
