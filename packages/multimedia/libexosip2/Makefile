PACKAGE = libeXosip2
VERSION = 3.5.0

LOCATION = http://download.savannah.gnu.org/releases/exosip
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sip_reg \
	$(prefix)/lib/*.so.*
