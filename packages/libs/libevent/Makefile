PACKAGE = libevent
VERSION = 2.0.15-stable

LOCATION = https://github.com/downloads/$(PACKAGE)/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
