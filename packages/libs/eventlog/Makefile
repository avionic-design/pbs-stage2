PACKAGE = eventlog
VERSION = 0.2.12
LICENSE = custom

MAJOR = $(word 1,$(subst ., ,$(VERSION)))
MINOR = $(word 2,$(subst ., ,$(VERSION)))

LOCATION = https://my.balabit.com/downloads/$(PACKAGE)/$(MAJOR).$(MINOR)
TARBALLS = $(PACKAGE)_$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
