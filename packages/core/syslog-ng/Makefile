PACKAGE = syslog-ng
VERSION = 3.0.5

LOCATION = http://www.balabit.com/downloads/files/$(PACKAGE)/open-source-edition/$(VERSION)/source
TARBALLS = $(PACKAGE)_$(VERSION).tar.gz

include packages/autotools.mk

conf-args += \
	--disable-glibtest

prunefiles =
stripfiles = \
	$(prefix)/bin/loggen \
	$(prefix)/sbin/syslog-ng
