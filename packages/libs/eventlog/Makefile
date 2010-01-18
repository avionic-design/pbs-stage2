PACKAGE = eventlog
VERSION = 0.2.9

LOCATION = http://www.balabit.com/downloads/files/$(PACKAGE)/0.2
TARBALLS = $(PACKAGE)_$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libevtlog.la

stripfiles = \
	$(prefix)/lib/libevtlog.so.0.0.0
