PACKAGE = libeXosip2
VERSION = 4.1.0
LICENSE = GPL

LOCATION = http://download.savannah.gnu.org/releases/exosip
TARBALLS = $(PACKAGE)-$(VERSION).tar.gz

include packages/autotools.mk

prunefiles = \
	$(prefix)/lib/*.la

stripfiles = \
	$(prefix)/bin/sip_reg \
	$(prefix)/lib/*.so.*
