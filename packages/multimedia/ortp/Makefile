PACKAGE = ortp
VERSION = 0.16.4

LOCATION = http://download.savannah.gnu.org/releases/linphone/$(PACKAGE)/sources
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/lib/*.so.*
