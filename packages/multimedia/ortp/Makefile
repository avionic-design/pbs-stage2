PACKAGE = ortp
VERSION = 0.16.1

LOCATION = http://www.very-clever.com/download/nongnu/linphone/$(PACKAGE)/sources
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/libortp.la

stripfiles = \
	$(prefix)/lib/libortp.so.8.0.0
